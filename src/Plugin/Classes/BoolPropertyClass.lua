local CorePropertyClass = require(script.Parent.CorePropertyClass)

local BoolPropertyClass = {}

function BoolPropertyClass.__index(obj, key) -- allow inheritance
    return BoolPropertyClass[key] or CorePropertyClass[key]
end

function BoolPropertyClass:New(name, order, default)
    local new = setmetatable(CorePropertyClass:New('bool', name, order, default), self)
    return new
end

return BoolPropertyClass
