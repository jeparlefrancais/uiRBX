local StyleManagerClass = {}

local Properties = {
    GuiObject = {
        'AnchorPoint',
        'BackgroundColor3',
        'BackgroundTransparency',
        'BorderColor3',
        'BorderSizePixel',
        'Position',
        'Size',
        'ZIndex'
    },
    GuiButton = {
        'AutoButtonColor'
    },
    ImageLabel = {
        'Image',
        'ImageColor3',
        'ImageRectOffset',
        'ImageRectSize',
        'ImageTransparency',
        'ScaleType',
        'SliceCenter',
        'TileSize',
    },
    ImageButton = {
        'Image',
        'ImageColor3',
        'ImageRectOffset',
        'ImageRectSize',
        'ImageTransparency',
        'ScaleType',
        'SliceCenter',
        'TileSize',
    },
    TextLabel = {
        'Font',
        'Text',
        'TextColor3',
        'TextScaled',
        'TextStrokeColor3',
        'TextStrokeTransparency',
        'TextTransparency',
        'TextWrapped',
        'TextXAlignment',
        'TextYAlignment'
    },
    TextButton = {
        'Font',
        'Text',
        'TextColor3',
        'TextScaled',
        'TextStrokeColor3',
        'TextStrokeTransparency',
        'TextTransparency',
        'TextWrapped',
        'TextXAlignment',
        'TextYAlignment'
    },
    TextBox = {
        'ClearTextOnFocus',
        'Font',
        'MultiLine',
        --'PlaceholderColor3',
        --'PlaceholderText',
        'Text',
        'TextColor3',
        'TextScaled',
        'TextStrokeColor3',
        'TextStrokeTransparency',
        'TextTransparency',
        'TextWrapped',
        'TextXAlignment',
        'TextYAlignment'
    },
    ScrollingFrame = {
        'BottomImage',
        'MidImage',
        'TopImage',
    }
}

function StyleManagerClass:New(pluginModel)
    local new = setmetatable({}, self)
    self.__index = self
    
    new.plugin = pluginModel
    new.Styles = {}
    new.clipboardStyle = nil
    new.selectedStyle = 'Default'
    new:AddStyle('Default', {
        AnchorPoint = Vector2.new(0, 0),
        BorderPixelSize = 0,
        Size = UDim2.new(.2, 0, .2, 0),
        Position = UDim2.new(0, 0, 0, 0),
        Text = 'Enter text',
        TextScaled = true
    })

    return new
end

function StyleManagerClass:AddStyle(name, styleDict)
    self.Styles[name] = styleDict
end

function StyleManagerClass:GetStyleFromObject(object)
    local allProperties = {}
    for className, list in pairs(Properties) do
        if object:IsA(className) then
            for _, property in ipairs(list) do
                table.insert(allProperties, property)
            end
        end
    end

    local getProperties = self.plugin.Dialogs.MultiSelectElementInList('Select Properties for Style', allProperties)

    if getProperties then
        local style = {}
        for _, property in ipairs(getProperties) do
            style[property] = object[property]
        end
        return style
    else
        return nil
    end
end

function StyleManagerClass:ApplyStyle(style, object)
    for key, value in pairs(style) do
        pcall(function()
            object[key] = value
        end)
    end
end

function StyleManagerClass:Convert(object, newClass)

end

function StyleManagerClass:Create(className)
    local obj = Instance.new(className)
    self:ApplyStyle(self:GetStyle(self.selectedStyle), obj)
    return obj
end

function StyleManagerClass:HasStyle(name)
    return self.Styles[name] ~= nil
end

function StyleManagerClass:GetStyle(name)
    return self.Styles[name]
end

function StyleManagerClass:HasCopiedStyle()
    return self.clipboardStyle ~= nil 
end

function StyleManagerClass:CopyStyle(object)
    local style = self:GetStyleFromObject(object)
    if style then
        self.clipboardStyle = style
    end
end

function StyleManagerClass:PasteStyle(object)
    self:ApplyStyle(self.clipboardStyle, object)
end

return StyleManagerClass
