local Create = require(script.Parent.Parent.Parent.UI.Utils.Create)
local SetHoverAnimation = require(script.Parent.Parent.Parent.UI.Utils.SetHoverAnimation)
local CoreCancelButton = require(script.Parent.CoreCancelButton)

local function AnchorPoint(title)
    
    local dialog = CoreCancelButton(title)

    Create'UIAspectRatioConstraint'{
        AspectRatio = 1,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        DominantAxis = Enum.DominantAxis.Width,
        Parent = dialog.Content
    }

    Create'UIPadding'{
        Name = 'PropertiesPadding',
        PaddingBottom = UDim.new(0, 3),
        PaddingLeft = UDim.new(0, 3),
        PaddingRight = UDim.new(0, 3),
        PaddingTop = UDim.new(0, 3),
        Parent = dialog.Content
    }

    for r=1,3 do
        for c=1,3 do
            local button = Create'TextButton'{
                Name = 'AnchorButton',
                AnchorPoint = Vector2.new((c - 1)/2, (r - 1)/2),
                AutoButtonColor = false,
                BackgroundColor3 = ((r % 2) == (c % 2)) and Color3.fromRGB(99, 128, 255) or Color3.fromRGB(84, 111, 217),
                BorderSizePixel = 0,
                Position = UDim2.new((c - 1)/2, 0, (r - 1)/2, 0),
                Size = UDim2.new(.333, -3, .333, -3),
                Text = '',
                Parent = dialog.Content
            }

            SetHoverAnimation(button, {BackgroundColor3 = Color3.fromRGB(56, 73, 145)})
            
            button.MouseButton1Click:Connect(function()
                dialog.Result:Fire(button.AnchorPoint)
            end)
        end
    end

    return dialog
end

return AnchorPoint
