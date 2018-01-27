local GetAnimation = require(script.Parent.GetAnimation)

local function Create(instanceClass)
    local obj = Instance.new(instanceClass)
    return function(properties)
        for key, val in pairs(properties) do
            obj[key] = val
        end
        return obj
    end
end

local function SetAnimations(button, hoverProperties)
    local normalProperties = {}
    for property, value in pairs(hoverProperties) do
        normalProperties[property] = button[property]
    end
    local toNormal = GetAnimation(button, .2, normalProperties)
    local toHover = GetAnimation(button, .2, hoverProperties)
    button.MouseEnter:Connect(function() toHover:Play() end)
    button.MouseLeave:Connect(function() toNormal:Play() end)
end

local function CreateSection(section, parent)
    local sectionButton = Create'TextButton'{
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(68, 87, 175),
        BorderSizePixel = 0,
        Font = Enum.Font.SourceSansSemibold,
        LayoutOrder = 2 * section:GetPosition(),
        Name = section:GetName() .. 'Button',
        Parent = parent,
        Size = UDim2.new(1, 0, 1, 0),
        Text = section:GetName(),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true
    }

    SetAnimations(sectionButton, {BackgroundColor3 = Color3.fromRGB(49, 63, 127)})
    
    local sectionFrame = Create'Frame'{
        BackgroundColor3 = Color3.fromRGB(133, 166, 255),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        LayoutOrder = 2 * section:GetPosition() + 1,
        Name = section:GetName() .. 'Section',
        Parent = parent,
        Size = UDim2.new(1, 0, section:GetSize(), 0)
    }

    local Opened = true
    local ClosedSize = UDim2.new(1, 0, 0, 0)
    local OpenSize = sectionFrame.Size
    sectionButton.MouseButton1Click:Connect(function()
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
        local actionButton = Create'TextButton'{
            AutoButtonColor = false,
            BackgroundColor3 = Color3.fromRGB(99, 128, 255),
            BorderSizePixel = 0,
            Font = Enum.Font.SourceSans,
            LayoutOrder = 2 * section:GetPosition(),
            Name = section:GetName() .. 'Button',
            Parent = sectionFrame,
            Size = UDim2.new(1, 0, actionButtonSize, 0),
            Text = action:GetName(),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true
        }

        SetAnimations(actionButton, {BackgroundColor3 = Color3.fromRGB(84, 111, 217)})

        local enabled = false
        actionButton.MouseButton1Click:Connect(function()
            if not enabled then
                enabled = true
                action:Fire()
                wait()
                enabled = false
            end
        end)
    end
end

local function CreateGui(size, pluginModel)
    local gui = Create'ScreenGui'{Name = 'UIRbxEditor'}

    local frame = Create'Frame'{
        AnchorPoint = Vector2.new(0, .5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        Parent = gui,
        Position = UDim2.new(0, 0, .5, 0),
        Size = UDim2.new(.2, 0, size, 0)
    }

    local listLayout = Create'UIListLayout'{
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, 0),
        Parent = frame,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center
    }

    for name, section in pairs(pluginModel.Sections) do
        CreateSection(section, frame)
    end

    return gui
end

return CreateGui
