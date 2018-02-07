local Create = require(script.Parent.Parent.Utils.Create)
local SetHoverAnimation = require(script.Parent.Parent.Utils.SetHoverAnimation)
local Core = require(script.Parent.Core)

local function CoreButton(title, buttonText, buttonColor, buttonHoverColor)
    local dialog = Core(title)
    
    dialog.Content.Size = UDim2.new(1, 0, .8, 0)

    local button = Create'TextButton'{
        Name = 'MainButton',
        AnchorPoint = Vector2.new(.5, 0),
        AutoButtonColor = false,
        BackgroundColor3 = buttonColor or Color3.fromRGB(99, 128, 255),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Position = UDim2.new(.5, 0, .9, 0),
        Size = UDim2.new(1, 0, .1, 0),
        Font = Enum.Font.SourceSansLight,
        Text = buttonText,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = .8,
        TextScaled = true,
        Parent = dialog
    }

    local buttonFront = Create'TextLabel'{
        Name = 'FrontText',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, -2, 0, -2),
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.SourceSansLight,
        Text = buttonText,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = 0,
        TextScaled = true,
        ZIndex = 2,
        Parent = button
    }

    SetHoverAnimation(button, {BackgroundColor3 = buttonHoverColor or Color3.fromRGB(84, 111, 217)})

    return dialog
end

return CoreButton
