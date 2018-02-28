local CoreAction = {}

function CoreAction:New(buttonType, name, order, eventFunction)
    local new = setmetatable({}, self)
    self.__index = self

    new.type = buttonType
    new.name = name
    new.order = order
    new.eventFunction = eventFunction

    return new
end

function CoreAction:Fire(...)
    self.eventFunction(...)
end

function CoreAction:GetName()
    return self.name
end

function CoreAction:GetOrder()
    return self.order
end

function CoreAction:GetType()
    return self.type
end

return CoreAction
