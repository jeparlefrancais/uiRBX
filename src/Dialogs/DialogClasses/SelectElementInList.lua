local Create = require(script.Parent.Parent.Parent.UI.Utils.Create)
local SetHoverAnimation = require(script.Parent.Parent.Parent.UI.Utils.SetHoverAnimation)
local CoreCancelButton = require(script.Parent.CoreCancelButton)

local ElementsPerPage = 5

local function SelectElementInList(title, stringList, selectedFunction)
    
    local dialog = CoreCancelButton(title)
    
    local totalElements = #stringList

    local scrollingFrame = Create'ScrollingFrame'{
        Name = 'ScrollingContent',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(1, -12, 1, 0),
        CanvasSize = UDim2.new(0, 0, (totalElements > ElementsPerPage and .25 * totalElements or 1), 0),
        Parent = dialog.Content
    }

    local subContent = Create'Frame'{
        Name = 'SubContent',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, -12, 1, 0),
        Parent = scrollingFrame
    }

    local gridListLayout = Create'UIGridLayout'{
        Name = 'GridLayout',
        CellPadding = UDim2.new(0, 0, 0, 5),
        CellSize = UDim2.new(1, 0, totalElements > ElementsPerPage and 1/totalElements or 1/ElementsPerPage, -5),
        FillDirection = Enum.FillDirection.Horizontal,
        FillDirectionMaxCells = 1,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = subContent
    }

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
            Parent = subContent
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


    local textConstraint = Create'UITextSizeConstraint'{
        MaxTextSize = 50,
        MinTextSize = 10,
        Parent = message
    }

    textConstraint:Clone().Parent = messageShadow

    return dialog
end

return SelectElementInList
