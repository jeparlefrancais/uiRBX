local SetHoverAnimation = require(script.Parent.Parent.Parent.UI.Utils.SetHoverAnimation)

local CoreButton = require(script.Parent.CoreButton)

local function CoreAcceptCancelButtons(title)
    local dialog = CoreButton(title, 'Cancel', Color3.fromRGB(255, 99, 99), Color3.fromRGB(179, 70, 70))

    dialog.MainButton.Position = UDim2.new(0, 0, .9, 0)
    dialog.MainButton.Size = UDim2.new(.5, -5, .1, 0)
    dialog.MainButton.AnchorPoint = Vector2.new(0, 0)

    local acceptButton = dialog.MainButton:Clone()
    acceptButton.Name = 'AcceptButton'
    acceptButton.Position = UDim2.new(1, 0, .9, 0)
    acceptButton.AnchorPoint = Vector2.new(1, 0)
    acceptButton.BackgroundColor3 = Color3.fromRGB(75, 213, 116)
    acceptButton.Text = 'Accept'
    acceptButton.FrontText.Text = acceptButton.Text
    acceptButton.Parent = dialog
    
    SetHoverAnimation(acceptButton, {BackgroundColor3 = Color3.fromRGB(63, 180, 96)})

    dialog.MainButton.MouseButton1Click:Connect(function()
        dialog.Result:Fire()
    end)

    return dialog
end

return CoreAcceptCancelButtons
