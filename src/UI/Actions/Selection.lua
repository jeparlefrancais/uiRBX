local Create = require(script.Parent.Parent.Utils.Create)
local SetHoverAnimation = require(script.Parent.Parent.Utils.SetHoverAnimation)

local function CreateSelection(actionButton, action, pluginModel)
    SetHoverAnimation(actionButton, {BackgroundColor3 = Color3.fromRGB(84, 111, 217)})

    local subButtons = action:GetSubButtons()
    local totalButtons = #subButtons

    local subFrameSize = UDim2.new(1, 0, totalButtons, 0)
    local subFramePosition = UDim2.new(1, 0, .5, 0)
    local subFrameHiddenSize = UDim2.new(1, 0, 0, 0)
    local subFrameHiddenPosition = UDim2.new(1, 0, .5, 0)

    local subFrame = Create'Frame'{
        AnchorPoint = Vector2.new(0, .5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = subFrameHiddenPosition,
        Size = subFrameHiddenSize,
        Visible = false,
        Parent = actionButton
    }
    local subList = Create'UIListLayout'{
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 0),
        Parent = subFrame
    }

    actionButton.MouseButton1Click:Connect(function()
        subFrame.Visible = true
        pluginModel.Events.CloseActionSubMenuOpened:Fire(action:GetName())
        subFrame:TweenSizeAndPosition(
            subFrameSize, -- end size
            subFramePosition, -- end position
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            .2, -- time
            true -- override
        )
    end)
    
    local function CloseSubFrame()
        subFrame:TweenSizeAndPosition(
            subFrameHiddenSize, -- end size
            subFrameHiddenPosition, -- end position
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            .2, -- time
            true, -- override
            function(status) -- callback function
                if status == Enum.TweenStatus.Completed then
                    subFrame.Visible = false
                end
            end
        )
    end

    for order, subButtonName in pairs(subButtons) do
        local subActionButton = Create'TextButton'{
            AutoButtonColor = false,
            BackgroundColor3 = (order % 2 == 0 and Color3.fromRGB(99, 128, 255) or Color3.fromRGB(124, 149, 255)), -- alternate color
            BorderSizePixel = 0,
            Font = Enum.Font.SourceSans,
            LayoutOrder = order,
            Name = subButtonName .. 'Button',
            Size = UDim2.new(1, 0, 1 / totalButtons, 0),
            Text = subButtonName,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true,
            Parent = subFrame
        }

        SetHoverAnimation(subActionButton, {BackgroundColor3 = Color3.fromRGB(55, 72, 143)})

        local enabled = false
        subActionButton.MouseButton1Click:Connect(function()
            if not enabled then
                enabled = true
                CloseSubFrame()
                action:Fire(subButtonName, pluginModel)
                wait()
                enabled = false
            end
        end)
    end

    subFrame.MouseLeave:Connect(CloseSubFrame)
    pluginModel.Events.CloseActionSubMenuOpened.Event:Connect(function(except)
        if except ~= action:GetName() then
            CloseSubFrame()
        end
    end)
end

return CreateSelection
