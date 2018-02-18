local UIS = game:GetService('UserInputService')

local Create = require(script.Parent.Create)
local CreateActionButton = require(script.Parent.CreateActionButton)
local SetHoverAnimation = require(script.Parent.SetHoverAnimation)

local function CreateSection(section, parent, pluginModel)
    local sectionButton = Create'TextButton'{
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(68, 87, 175),
        BorderSizePixel = 0,
        Draggable = true,
        Font = Enum.Font.SourceSansSemibold,
        LayoutOrder = 2 * section:GetPosition(),
        Name = section:GetName() .. 'Button',
        Parent = parent,
        Size = UDim2.new(1, 0, 1, 0),
        Text = section:GetName(),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true
    }

    SetHoverAnimation(sectionButton, {BackgroundColor3 = Color3.fromRGB(49, 63, 127)})
    
    local sectionFrame = Create'Frame'{
        BackgroundColor3 = Color3.fromRGB(133, 166, 255),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        LayoutOrder = 2 * section:GetPosition() + 1,
        Name = section:GetName() .. 'Section',
        Parent = parent,
        Size = UDim2.new(1, 0, section:GetSize(), 0)
    }

    -- make the section button draggable
    local DragStartTime = nil
    local DragBeginMouseLocation = nil
    local ScreenGui = parent.Parent
    local OriginalPosition = nil
    local DragDelay = .2
    local MinimalPixelDisplacement = 10
    
    sectionButton.DragBegin:Connect(function()
        DragStartTime = tick()
        DragBeginMouseLocation = UIS:GetMouseLocation()
        OriginalPosition = parent.Position
    end)

    sectionButton.DragStopped:Connect(function()
        DragStartTime = nil
        DragBeginMouseLocation = nil
        OriginalPosition = nil
    end)

    UIS.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if DragStartTime ~= nil then
                local mousePixelDifference = UIS:GetMouseLocation() - DragBeginMouseLocation
                if (tick() - DragStartTime) >= DragDelay
                    and mousePixelDifference.magnitude >= MinimalPixelDisplacement then
                    local goalLocation = OriginalPosition + UDim2.new(
                        mousePixelDifference.X / ScreenGui.AbsoluteSize.X,  -- Scale-X
                        0,                                                  -- Offset-X
                        mousePixelDifference.Y / ScreenGui.AbsoluteSize.Y,  -- Scale-Y
                        0                                                   -- Offset-Y
                    )
                    parent:TweenPosition(goalLocation, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, .15, true)
                end
            end
        end
    end)

    local Opened = true
    local ClosedSize = UDim2.new(1, 0, 0, 0)
    local OpenSize = sectionFrame.Size
    sectionButton.MouseButton1Click:Connect(function()
        if DragStartTime == nil or (UIS:GetMouseLocation() - DragBeginMouseLocation).magnitude < MinimalPixelDisplacement then
            Opened = not Opened
            sectionFrame.Visible = true
            sectionFrame:TweenSize(Opened and OpenSize or ClosedSize,
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                .2,
                true,
                function(status)
                    if status == Enum.TweenStatus.Completed then
                        sectionFrame.Visible = Opened
                    end
                end
            )
        end
    end)

    -- Create Action buttons

    if section:GetSize() > 1 then
        local listLayout = Create'UIListLayout'{
            FillDirection = Enum.FillDirection.Vertical,
            Padding = UDim.new(0, 0),
            Parent = sectionFrame,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center
        }
    end

    local actionButtonSize = 1 / section:GetSize()
    for _, action in ipairs(section:GetActions()) do
        CreateActionButton(action, actionButtonSize, pluginModel).Parent = sectionFrame
    end
end

return CreateSection