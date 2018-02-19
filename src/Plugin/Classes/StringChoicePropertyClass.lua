local CorePropertyClass = require(script.Parent.CorePropertyClass)

local StringChoicePropertyClass = {}

function StringChoicePropertyClass.__index(obj, key) -- allow inheritance
    return StringChoicePropertyClass[key] or CorePropertyClass[key]
end

function StringChoicePropertyClass:New(name, order, choices, default)
    local new = setmetatable(CorePropertyClass:New('StringChoice', name, order, default), self)
    new.choices = choices
    return new
end

function StringChoicePropertyClass:GetChoices()
    return self.choices
end

return StringChoicePropertyClass
