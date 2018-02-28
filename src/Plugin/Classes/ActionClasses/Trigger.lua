local CoreAction = require(script.Parent.CoreAction)

local Trigger = {}

function Trigger.__index(obj, key) -- allow inheritance
    return Trigger[key] or CoreAction[key]
end

function Trigger:New(name, order, eventFunction)
    local new = setmetatable(CoreAction:New('Trigger', name, order, eventFunction), self)
    return new
end

return Trigger
