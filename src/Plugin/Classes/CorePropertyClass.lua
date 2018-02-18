local CoreProperty = {}

function CoreProperty:New(propertyType, name, order, default)
    local new = setmetatable({}, self)
    self.__index = self
    new.pluginModel = nil
    new.type = propertyType
    new.name = name
    new.order = order
    new.value = default
    new.default = default
    new.changedFunction = nil
    return new
end

function CoreProperty:Connect(eventFunction)
    self.changedFunction = eventFunction
end

function CoreProperty:GetName()
    return self.name
end

function CoreProperty:GetOrder()
    return self.order
end

function CoreProperty:Get()
    return self.value
end

function CoreProperty:GetType()
    return self.type
end

function CoreProperty:Set(value)
    if self.value ~= value then
        self.value = value
        if self.changedFunction ~= nil then
            self.changedFunction(pluginModel, value)
        end
    end
end

function CoreProperty:SetPlugin(pluginModel)
    self.pluginModel = pluginModel
end

function CoreProperty:Reset()
    self.value = self.default
end

return CoreProperty
