local ActionClass = {}

function ActionClass:New(name, eventFunction)
    local new = setmetatable({}, self)
    self.__index = self
    new.name = name
    new.eventFunction = eventFunction
    return new
end

function ActionClass:Fire()
    self.eventFunction()
end

function ActionClass:GetName()
    return self.name
end

return ActionClass
