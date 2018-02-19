local GetAnimation = require(script.Parent.Utils.GetAnimation)
local Create = require(script.Parent.Utils.Create)
local CreateSection = require(script.Parent.Utils.CreateSection)
local CreateProperty = require(script.Parent.Utils.CreateProperty)

local PROPERTIES_PER_PAGE = 20

local function CreateGui(pluginModel)
    local gui = Create'ScreenGui'{
        Name = 'UIRbxEditor',
        Enabled = true,
        Parent = game:GetService('CoreGui')
    }

    local frame = Create'Frame'{
        AnchorPoint = Vector2.new(0, .5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        Position = UDim2.new(0, 0, .5, 0),
        Size = UDim2.new(1, 0, pluginModel:GetProperty('Size'), 0),
        Visible = false,
        Parent = gui
    }

    Create'UIListLayout'{
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, 0),
        Parent = frame,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center
    }

    Create'UIAspectRatioConstraint'{
        AspectRatio = 8,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        DominantAxis = Enum.DominantAxis.Width,
        Parent = frame
    }

    for _, section in ipairs(pluginModel.Sections) do
        CreateSection(section, frame, pluginModel)
    end
    
    -- Create Properties panel
    local propertiesPanel = Create'Frame'{
        Name = 'PropertiesPanel',
        AnchorPoint = Vector2.new(0, .5),
        BackgroundColor3 = Color3.fromRGB(68, 87, 175),
        BackgroundTransparency = .4,
        BorderSizePixel = 0,
        Position = UDim2.new(1, 0, .5, 0),
        Size = UDim2.new(.2, 0, 1, 0),
        Parent = gui
    }
    
    Create'UIPadding'{
        Name = 'PropertiesPadding',
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 10),
        Parent = propertiesPanel
    }

    local titleProperties = Create'TextLabel'{
        AnchorPoint = Vector2.new(1, 0),
        Name = 'TitleLabel',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(1, 0, .05, 0),
        Font = Enum.Font.SourceSansLight,
        Text = 'Properties',
        TextScaled = true,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 2,
        Parent = propertiesPanel
    }

    Create'TextLabel'{
        Name = 'Shadow',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 2, 0, 2),
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.SourceSansLight,
        Text = titleProperties.Text,
        TextScaled = true,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = .8,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = titleProperties
    }

    local scrollingContent = Create'ScrollingFrame'{
        Name = 'ScrollingLayer',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, .05, 0),
        Size = UDim2.new(1, 0, .95, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = propertiesPanel
    }

    local content = Create'Frame'{
        Name = 'Content',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, -12, 1, 0),
        Parent = scrollingContent
    }

    Create'UIListLayout'{
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, 0),
        Parent = content,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top
    }

    local totalProperties = 0
    local propertyObjects = {}
    for propertyName, property in pairs(pluginModel.Properties) do
        table.insert(propertyObjects, CreateProperty(property, pluginModel))
        totalProperties = totalProperties + 1
    end

    if totalProperties > PROPERTIES_PER_PAGE then
        scrollingContent.CanvasSize = UDim2.new(0, 0, totalProperties / PROPERTIES_PER_PAGE, 0)
    end

    for _, object in ipairs(propertyObjects) do
        object.Size = UDim2.new(1, 0, 1/PROPERTIES_PER_PAGE, 0)
        object.Parent = content
    end


    -- EVENT CONNECTIONS
    pluginModel.Events.PluginEnabledChanged.Event:Connect(function(enabled)
        frame.Visible = enabled
    end)

    local toOpenPropertiesPanel = GetAnimation(propertiesPanel, .3, {AnchorPoint = Vector2.new(1, .5)})
    local toClosePropertiesPanel = GetAnimation(propertiesPanel, .3, {AnchorPoint = Vector2.new(0, .5)})
    pluginModel.Events.PropertiesOpenedChanged.Event:Connect(function(enabled)
        if enabled then
            toOpenPropertiesPanel:Play()
        else
            toClosePropertiesPanel:Play()
        end
    end)

    pluginModel.Events.PropertyChanged.Event:Connect(function(propertyName, value)
        if propertyName == 'Size' then
            frame.Size = UDim2.new(1, 0, value, 0)
        end
    end)

    return gui
end

return CreateGui
