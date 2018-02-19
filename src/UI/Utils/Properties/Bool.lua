local Create = require(script.Parent.Parent.Create)
local GetAnimation = require(script.Parent.Parent.GetAnimation)

local function CreateBoolProperty(property, pluginModel, contentParent)
    local boolSliderColorOn = Color3.fromRGB(72, 194, 63)
    local boolSliderColorOff = Color3.fromRGB(236, 80, 80)

    local sliderButton = Create'ImageButton'{
        Name = 'SliderButton',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(.5, 0, .5, 0),
        Size = UDim2.new(1, 0, 1, 0),
        Image = 'rbxassetid://1435770633',
        ImageColor3 = property:Get() and boolSliderColorOn or boolSliderColorOff,
        Parent = contentParent
    }

    Create'UIAspectRatioConstraint'{
        AspectRatio = 3,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        DominantAxis = Enum.DominantAxis.Width,
        Parent = sliderButton
    }

    Create'UIPadding'{
        Name = 'PropertiesPadding',
        PaddingBottom = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        PaddingTop = UDim.new(0, 5),
        Parent = sliderButton
    }

    local sliderKnob = Create'ImageLabel'{
        Name = 'ImageLabel',
        AnchorPoint = Vector2.new(property:Get() and 1 or 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(property:Get() and 1 or 0, 0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        Image = 'rbxassetid://1435770904',
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        Parent = sliderButton
    }

    Create'UIAspectRatioConstraint'{
        AspectRatio = 1,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        DominantAxis = Enum.DominantAxis.Width,
        Parent = sliderKnob
    }

    local toKnobOn = GetAnimation(sliderKnob, .4, {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 0)
    })
    local toKnobOff = GetAnimation(sliderKnob, .4, {
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.new(0, 0, 0, 0)
    })
    local toSliderOn = GetAnimation(sliderKnob, .4, {ImageColor3 = boolSliderColorOn})
    local toSliderOff = GetAnimation(sliderKnob, .4, {ImageColor3 = boolSliderColorOff})

    pluginModel.Events.PropertyChanged.Event:Connect(function(propertyName, value)
        if propertyName == property:GetName() then
            if value then
                toSliderOn:Play()
                toKnobOn:Play()
            else
                toSliderOff:Play()
                toKnobOff:Play()
            end
        end
    end)

    local enabled = false
    sliderButton.MouseButton1Click:Connect(function()
        if not enabled then
            enabled = true
            property:Set(not property:Get())
            wait()
            enabled = false
        end
    end)
end

return CreateBoolProperty
