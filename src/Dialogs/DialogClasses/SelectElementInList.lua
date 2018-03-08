local Create = require(script.Parent.Parent.Parent.UI.Utils.Create)
local SetHoverAnimation = require(script.Parent.Parent.Parent.UI.Utils.SetHoverAnimation)
local CoreList = require(script.Parent.CoreList)

local function SelectElementInList(title, stringList, selectedFunction)

    local dialog = CoreList(title, #stringList, 5, false)

    for index, element in pairs(stringList) do
        local elementButton = Create'TextButton'{
            Name = 'ElementButton',
            AnchorPoint = Vector2.new(.5, .5),
            AutoButtonColor = false,
            BackgroundColor3 = Color3.fromRGB(99, 128, 255),
            BackgroundTransparency = .2,
            BorderSizePixel = 0,
            Position = UDim2.new(.5, 0, .5, 0),
            Size = UDim2.new(.5, 0, .8, 0),
            Font = Enum.Font.SourceSansLight,
            Text = element,
            TextColor3 = Color3.fromRGB(0, 0, 0),
            TextTransparency = .8,
            TextScaled = true,
            Parent = dialog.Content.ScrollingContent.SubContent
        }

        local frontLabel = Create'TextLabel'{
            Name = 'FrontText',
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, -2, 0, -2),
            Size = UDim2.new(1, 0, 1, 0),
            Font = Enum.Font.SourceSansLight,
            Text = elementButton.Text,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true,
            Parent = elementButton
        }
        
        SetHoverAnimation(elementButton, {BackgroundColor3 = Color3.fromRGB(81, 106, 208)})

        elementButton.MouseButton1Click:Connect(function()
            dialog.Result:Fire(selectedFunction == nil and element or selectedFunction(element))
        end)
    end

    return dialog
end

return SelectElementInList
