local Create = require(script.Parent.Utils.Create)

local CreatePropertyType = {}
for _, createPropertyModule in ipairs(script.Parent.Properties:GetChildren()) do
    CreatePropertyType[createPropertyModule.Name] = require(createPropertyModule)
end

local function CreateProperty(property, pluginModel)
    local frame = Create'Frame'{
        Name = 'Property',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 0)
    }
    
    Create'UIPadding'{
        Name = 'PropertiesPadding',
        PaddingBottom = UDim.new(.1, 0),
        PaddingLeft = UDim.new(.1, 0),
        PaddingRight = UDim.new(.1, 0),
        PaddingTop = UDim.new(.1, 0),
        Parent = frame
    }

    local nameLabel = Create'TextLabel'{
        Name = 'NameLabel',
        AnchorPoint = Vector2.new(0, .5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, .5, 0),
        Size = UDim2.new(.5, 0, 1, -5),
        Font = Enum.Font.SourceSansLight,
        Text = property:GetName() .. ':',
        TextScaled = true,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 2,
        Parent = frame
    }

    Create'TextLabel'{
        Name = 'Shadow',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 2, 0, 2),
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.SourceSansLight,
        Text = nameLabel.Text,
        TextScaled = true,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = .8,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = nameLabel
    }

    local content = Create'Frame'{
        Name = 'Content',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.525, 0, 0, 0),
        Size = UDim2.new(.45, 0, 1, 0),
        Parent = frame
    }

    CreatePropertyType[property:GetType()](property, pluginModel, content)

    return frame
end

return CreateProperty
