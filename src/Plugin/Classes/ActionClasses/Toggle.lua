local CoreAction = require(script.Parent.CoreAction)

local Toggle = {}

function Toggle.__index(obj, key) -- allow inheritance
    return Toggle[key] or CoreAction[key]
end

function Toggle:New(name, enabledName, disabledName, defaultState, groupName, order, eventFunction)
    local new = setmetatable(CoreAction:New('Toggle', name, order, eventFunction), self)
    new.enabledName = enabledName
    new.disabledName = disabledName
    new.state = defaultState
    new.groupName = groupName
    return new
end

function Toggle:Fire(...)
    self.state = not self.state
    self.eventFunction(self.state, ...)
end

function Toggle:Disable(...)
    if self.state then
        self.state = false
        self.eventFunction(false, ...)
    end
end

function Toggle:GetState()
    return self.state
end

function Toggle:GetCurrentName()
    return self.state and self.enabledName or self.disabledName
end

function Toggle:GetGroupName()
    return self.groupName
end

function Toggle:HasGroupName(groupName)
    return self.groupName == groupName
end

return Toggle
