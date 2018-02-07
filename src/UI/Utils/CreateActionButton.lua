local Create = require(script.Parent.Create)
local SetHoverAnimation = require(script.Parent.SetHoverAnimation)

local function CreateActionButton(action, actionButtonSize, order, pluginModel)
    local actionButton = Create'TextButton'{
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(99, 128, 255),
        BorderSizePixel = 0,
        Font = Enum.Font.SourceSans,
        LayoutOrder = order,
        Name = action:GetName() .. 'Button',
        Size = UDim2.new(1, 0, actionButtonSize, 0),
        Text = action:GetName(),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true
    }

    SetHoverAnimation(actionButton, {BackgroundColor3 = Color3.fromRGB(84, 111, 217)})

    local enabled = false
    actionButton.MouseButton1Click:Connect(function()
        if not enabled then
            enabled = true
            action:Fire(pluginModel)
            wait()
            enabled = false
        end
    end)

    return actionButton
end

return CreateActionButton
