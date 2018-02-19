local Create = require(script.Parent.Parent.Create)
local SetHoverAnimation = require(script.Parent.Parent.SetHoverAnimation)

local function CreateStringChoiceProperty(property, pluginModel, contentParent)
    local choiceButton = Create'TextButton'{
        Name = 'ChoiceButton',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        Text = property:Get(),
        TextScaled = true,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = contentParent
    }

    SetHoverAnimation(choiceButton, {TextColor3 = Color3.fromRGB(200, 200, 200)})

    pluginModel.Events.PropertyChanged.Event:Connect(function(propertyName, value)
        if propertyName == property:GetName() then
            choiceButton.Text = value
        end
    end)

    local enabled = false
    choiceButton.MouseButton1Click:Connect(function()
        if not enabled then
            enabled = true
            local choice = pluginModel.Dialogs.SelectElementInList('Select ' .. property:GetName() .. ' Property', property:GetChoices())
            if choice then
                property:Set(choice)
            end
            wait()
            enabled = false
        end
    end)
end

return CreateStringChoiceProperty
