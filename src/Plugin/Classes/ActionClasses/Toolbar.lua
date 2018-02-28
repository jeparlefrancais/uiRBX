local CoreAction = require(script.Parent.CoreAction)

local Toolbar = {}

function Toolbar.__index(obj, key) -- allow inheritance
    return Toolbar[key] or CoreAction[key]
end

function Toolbar:New(name, toolbarName, tip, image, order, eventFunction)
    local new = setmetatable(CoreAction:New('Toolbar', name, order, eventFunction), self)
    new.toolbarName = toolbarName
    new.tip = tip
    new.image = image
    return new
end

function Toolbar:GetToolbarName()
    return self.toolbarName
end

function Toolbar:GetTip()
    return self.tip
end

function Toolbar:GetImage()
    return self.image
end

return Toolbar
