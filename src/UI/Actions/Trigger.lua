local SetHoverAnimation = require(script.Parent.Parent.Utils.SetHoverAnimation)

local function CreateTrigger(actionButton, action, pluginModel)
    SetHoverAnimation(actionButton, {BackgroundColor3 = Color3.fromRGB(84, 111, 217)})

    local enabled = false
    actionButton.MouseButton1Click:Connect(function()
        if not enabled then
            enabled = true
            pluginModel.Events.CloseActionSubMenuOpened:Fire()
            action:Fire(pluginModel)
            wait()
            enabled = false
        end
    end)
end

return CreateTrigger
