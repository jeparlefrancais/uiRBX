local CorePropertyClass = require(script.Parent.Core)

local BoolPropertyClass = {}

function BoolPropertyClass.__index(obj, key) -- allow inheritance
    return BoolPropertyClass[key] or CorePropertyClass[key]
end

function BoolPropertyClass:New(name, order, default)
    local new = setmetatable(CorePropertyClass:New('Bool', name, order, default), self)
    return new
end

return BoolPropertyClass
