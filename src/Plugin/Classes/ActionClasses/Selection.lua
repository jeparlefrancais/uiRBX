local CoreAction = require(script.Parent.CoreAction)

local Selection = {}

function Selection.__index(obj, key) -- allow inheritance
    return Selection[key] or CoreAction[key]
end

function Selection:New(name, subButtonList, order, eventFunction)
    local new = setmetatable(CoreAction:New('Selection', name, order, eventFunction), self)
    new.subButtonList = subButtonList
    return new
end

function Selection:GetSubButtons()
    return self.subButtonList
end

return Selection
