local Create = require(script.Parent.Parent.Utils.Create)
local SetHoverAnimation = require(script.Parent.Parent.Utils.SetHoverAnimation)

local function CreateNumberProperty(property, pluginModel, contentParent)
    Create'UIListLayout'{
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 0),
        Parent = contentParent,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center
    }

    local numberBox = Create'TextBox'{
        Name = 'NumberBox',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClearTextOnFocus = false,
        LayoutOrder = 2,
        Size = UDim2.new(.4, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        Text = string.format(string.format('%%0.%df', property:GetPrecision()), property:Get()),
        TextScaled = true,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = contentParent
    }

    local decreaseButton = Create'TextButton'{
        Name = 'DecreaseButton',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Size = UDim2.new(.2, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        Text = '-',
        TextScaled = true,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = contentParent
    }

    local increaseButton = Create'TextButton'{
        Name = 'IncreaseButton',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        Size = UDim2.new(.2, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        Text = '+',
        TextScaled = true,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = contentParent
    }

    SetHoverAnimation(decreaseButton, {TextColor3 = Color3.fromRGB(200, 200, 200)})
    SetHoverAnimation(increaseButton, {TextColor3 = Color3.fromRGB(200, 200, 200)})

    pluginModel.Events.PropertyChanged.Event:Connect(function(propertyName, value)
        if propertyName == property:GetName() then
            numberBox.Text = string.format(string.format('%%0.%df', property:GetPrecision()), value)
        end
    end)

    numberBox.FocusLost:Connect(function()
        local newValue = tonumber(numberBox.Text)
        if newValue then
            if newValue > property:GetMaximum() then
                newValue = property:GetMaximum()
            end
            if newValue < property:GetMinimum() then
                newValue = property:GetMinimum()
            end
            property:Set(newValue)
        else
            numberBox.Text = string.format(string.format('%%0.%df', property:GetPrecision()), value)
        end
    end)

    local enabled = false
    decreaseButton.MouseButton1Click:Connect(function()
        if not enabled then
            enabled = true
            property:Decrease()
            wait()
            enabled = false
        end
    end)
    increaseButton.MouseButton1Click:Connect(function()
        if not enabled then
            enabled = true
            property:Increase()
            wait()
            enabled = false
        end
    end)
end

return CreateNumberProperty
