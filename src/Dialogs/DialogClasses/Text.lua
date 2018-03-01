local Create = require(script.Parent.Parent.Parent.UI.Utils.Create)

local CoreAcceptCancelButtons = require(script.Parent.CoreAcceptCancelButtons)

local function Text(title, defaultText)
    local dialog = CoreAcceptCancelButtons(title)

    local textBox = Create'TextBox'{
        AnchorPoint = Vector2.new(.5, .5),
        ClearTextOnFocus = false,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = .85,
        BorderSizePixel = 0,
        Position = UDim2.new(.5, 0, .5, 0),
        Size = UDim2.new(.5, 0, .8, 0),
        Font = Enum.Font.SourceSansLight,
        TextScaled = true,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = .8,
        Text = defaultText or '',
        Parent = dialog.Content
    }

    local frontText = Create'TextLabel'{
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, -2, 0, -2),
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.SourceSansLight,
        TextScaled = true,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = 0,
        Text = textBox.Text,
        Parent = textBox
    }

    local textSizeConstraint = Create'UITextSizeConstraint'{
        MaxTextSize = 50,
        MinTextSize = 10,
        Parent = textBox
    }
    textSizeConstraint:Clone().Parent = frontText

    textBox.Changed:Connect(function(property)
        if property == 'Text' then
            frontText.Text = textBox.Text
        end
    end)

    dialog.AcceptButton.MouseButton1Click:Connect(function()
        dialog.Result:Fire(textBox.Text)
    end)

    return dialog
end

return Text
