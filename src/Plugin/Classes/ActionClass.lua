local ActionClass = {}

function ActionClass:New(buttonType, name, order, ...)
    local new = setmetatable({}, self)
    self.__index = self
    new.type = buttonType
    new.name = name
    new.order = order

    if buttonType == 'Trigger' then
        local eventFunction = ...
        new.eventFunction = eventFunction

    elseif buttonType == 'Selection' then
        local subButtonList, eventFunction = ...
        new.subButtonList = subButtonList
        new.eventFunction = eventFunction  
        
    elseif buttonType == 'Toolbar' then
        local toolbarName, tip, image, eventFunction = ...
        new.toolbarName = toolbarName
        new.tip = tip
        new.image = image
        new.eventFunction = eventFunction  

    end

    return new
end

function ActionClass:Fire(...)
    self.eventFunction(...)
end

function ActionClass:GetName()
    return self.name
end

function ActionClass:GetOrder()
    return self.order
end

function ActionClass:GetType()
    return self.type
end

function ActionClass:GetSubButtons()
    return self.subButtonList
end

function ActionClass:GetToolbarName()
    return self.toolbarName
end

function ActionClass:GetTip()
    return self.tip
end

function ActionClass:GetImage()
    return self.image
end

return ActionClass
