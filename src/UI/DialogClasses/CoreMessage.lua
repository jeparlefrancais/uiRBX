local Create = require(script.Parent.Parent.Utils.Create)
local CoreButton = require(script.Parent.CoreButton)

local function CoreMessage(title, msg, buttonText, buttonColor, buttonHoverColor)
    
    local dialog = CoreButton(title, buttonText, buttonColor, buttonHoverColor)

    local message = Create'TextLabel'{
        Name = 'Message',
        AnchorPoint = Vector2.new(.5, .5),
        BackgroundTransparency = 1,
        Position = UDim2.new(.5, 0, .5, 0),
        Size = UDim2.new(.5, 0, .8, 0),
        Font = Enum.Font.SourceSansLight,
        Text = msg,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true,
        ZIndex = 2,
        Parent = dialog.Content
    }

    local messageShadow = Create'TextLabel'{
        Name = 'Shadow',
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 2, 0, 2),
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.SourceSansLight,
        Text = msg,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = .8,
        TextScaled = true,
        Parent = message
    }

    local textConstraint = Create'UITextSizeConstraint'{
        MaxTextSize = 50,
        MinTextSize = 10,
        Parent = message
    }

    textConstraint:Clone().Parent = messageShadow

    return dialog
end

return CoreMessage
