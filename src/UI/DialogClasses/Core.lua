local Create = require(script.Parent.Parent.Utils.Create)

local function Core(title)
    local frame = Create'Frame'{
        Name = 'Dialog',
        AnchorPoint = Vector2.new(.5, .5),
        BackgroundColor3 = Color3.fromRGB(168, 193, 255),
        BackgroundTransparency = .1,
        BorderSizePixel = 0,
        Position = UDim2.new(.5, 0, .5, 0),
        Size = UDim2.new(.5, 0, .5, 0)
    }

    local padding = Create'UIPadding'{
        Name = 'MainPadding',
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 10),
        Parent = frame
    }

    local content = Create'Frame'{
        Name = 'Content',
        AnchorPoint = Vector2.new(.5, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(.5, 0, .1, 0),
        Size = UDim2.new(1, 0, .9, 0),
        Parent = frame
    }

    local titleLabel = Create'TextLabel'{
        Name = 'Title',
        AnchorPoint = Vector2.new(.5, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(.5, 0, 0, 0),
        Size = UDim2.new(1, 0, .1, 0),
        Font = Enum.Font.SourceSansLight,
        Text = title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 2,
        Parent = frame
    }

    local titleShadow = Create'TextLabel'{
        Name = 'Shadow',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 2, 0, 2),
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.SourceSansLight,
        Text = title,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = .8,
        TextScaled = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = titleLabel
    }

    local result = Create'BindableEvent'{
        Name = 'Result',
        Parent = frame
    }

    return frame
end

return Core
