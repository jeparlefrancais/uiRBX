local Create = require(script.Parent.Parent.Parent.UI.Utils.Create)
local GetAnimation = require(script.Parent.Parent.Parent.UI.Utils.GetAnimation)
local CoreList = require(script.Parent.CoreList)

local function MultiSelectElementInList(title, stringList)

    local dialog = CoreList(title, #stringList, 7, true)

    local Checked = {}

    for index, element in pairs(stringList) do
        local isChecked = type(element) == 'table' and element[2] or false
        element = type(element) == 'table' and element[1] or element

        local elementButton = Create'TextButton'{
            Name = 'ElementButton',
            AutoButtonColor = false,
            BackgroundColor3 = Color3.fromRGB(99, 128, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = '',
            Parent = dialog.Content.ScrollingContent.SubContent
        }
        
        Create'UIListLayout'{
            Padding = UDim.new(0, 0),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = elementButton
        }

        local textLabel = Create'TextLabel'{
            Name = 'Label',
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, -2, 0, -2),
            Size = UDim2.new(.5, 0, 1, 0),
            Font = Enum.Font.SourceSansLight,
            Text = element .. ' : ',
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true,
            ZIndex = 2,
            Parent = elementButton
        }

        Create'TextLabel'{
            Name = 'Shadow',
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 2, 0, 2),
            Size = UDim2.new(1, 0, 1, 0),
            Font = Enum.Font.SourceSansLight,
            Text = textLabel.Text,
            TextColor3 = Color3.fromRGB(0, 0, 0),
            TextTransparency = .8,
            TextScaled = true,
            Parent = textLabel
        }

        local circle = Create'ImageLabel'{
            Name = 'Circle',
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(.15, 0, .8, 0),
            Image = 'rbxassetid://1489290683',
            ImageColor3 = Color3.fromRGB(60, 78, 154),
            Parent = elementButton
        }

        local check = Create'ImageLabel'{
            Name = 'Check',
            AnchorPoint = Vector2.new(.5, .5),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(.5, 0, .5, 0),
            Size = UDim2.new(.85, 0, .85, 0),
            Image = 'rbxassetid://1489557956', --1489557966',
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = isChecked and 0 or .9,
            Parent = circle
        }

        Create'UIAspectRatioConstraint'{
            AspectRatio = 1,
            AspectType = Enum.AspectType.FitWithinMaxSize,
            DominantAxis = Enum.DominantAxis.Width,
            Parent = circle
        }

        local toHoverCheck = GetAnimation(check, .2, {Size = UDim2.new(1.1, 0, 1.1, 0)})
        local toCheck = GetAnimation(check, .2, {Size = check.Size})

        elementButton.MouseEnter:Connect(function() toHoverCheck:Play() end)
        elementButton.MouseLeave:Connect(function() toCheck:Play() end)

        Checked[element] = isChecked

        local toCheck = GetAnimation(check, .2, {ImageTransparency = 0})
        local toUncheck = GetAnimation(check, .2, {ImageTransparency = .8})

        elementButton.MouseButton1Click:Connect(function()
            Checked[element] = not Checked[element]
            if Checked[element] then
                toCheck:Play()
            else
                toUncheck:Play()
            end
        end)

        dialog.AcceptButton.MouseButton1Click:Connect(function()
            local checkedList = {}
            for key, checked in pairs(Checked) do
                if checked then
                    table.insert(checkedList, key)
                end
            end
            dialog.Result:Fire(checkedList)
        end)
    end

    return dialog
end

return MultiSelectElementInList
