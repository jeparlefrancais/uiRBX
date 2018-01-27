local ActionClass = {}

function ActionClass:New(name, eventFunction)
    local new = setmetatable({}, self)
    self.__index = self
    new.name = name
    new.eventFunction = eventFunction
    return new
end

function ActionClass:Fire(pluginModel)
    self.eventFunction(pluginModel)
end

function ActionClass:GetName()
    return self.name
end

return ActionClass
