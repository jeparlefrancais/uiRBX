local GetAnimation = require(script.Parent.GetAnimation)

local function SetHoverAnimation(button, hoverProperties)
    local normalProperties = {}
    for property, value in pairs(hoverProperties) do
        normalProperties[property] = button[property]
    end
    local toNormal = GetAnimation(button, .2, normalProperties)
    local toHover = GetAnimation(button, .2, hoverProperties)
    button.MouseEnter:Connect(function() toHover:Play() end)
    button.MouseLeave:Connect(function() toNormal:Play() end)
end

return SetHoverAnimation
