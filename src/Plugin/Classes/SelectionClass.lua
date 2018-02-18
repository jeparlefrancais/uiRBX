local SEL = game:GetService('Selection')
local SGUI = game:GetService('StarterGui')
local UIS = game:GetService('UserInputService')

local function IsA(obj, classList)
    for _, class in ipairs(classList) do
        if obj:IsA(class) then return true end
    end
    return false
end

local function IsMouseInside(x, y, guiObject)
    local minX = guiObject.AbsolutePosition.X
    local maxX = guiObject.AbsolutePosition.X + guiObject.AbsoluteSize.X
    local minY = guiObject.AbsolutePosition.Y
    local maxY = guiObject.AbsolutePosition.Y + guiObject.AbsoluteSize.Y

    return (x >= minX
        and x <= maxX
        and y >= minY
        and y <= maxY)
end

local function SortGuiObjects(x, y)
    if x.ZIndex == y.ZIndex then
        return x:IsDescendantOf(y)
    else
        return x.ZIndex < y.ZIndex
    end
end

local SelectionClass = {}

function SelectionClass:New(pluginModel)
    local new = setmetatable({}, self)
    self.__index = self
    
    new.pluginModel = pluginModel
    new.canSelectUIElements = true

    UIS.InputEnded:Connect(function(input, processed)
        if new.canSelectUIElements then
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if not processed then
                    local mouseLocation = UIS:GetMouseLocation()
                    local guiObjects = {}
                    for _, screenGui in ipairs(SGUI:GetChildren()) do
                        if screenGui:IsA('ScreenGui') and screenGui.Enabled then
                            for _, guiObject in ipairs(screenGui:GetDescendants()) do
                                if guiObject:IsA('GuiObject') and guiObject.Visible then
                                    if IsMouseInside(mouseLocation.X, mouseLocation.Y, guiObject) then
                                        table.insert(guiObjects, guiObject)
                                    end
                                end
                            end
                        end
                    end

                    if #guiObjects > 0 then
                        table.sort(guiObjects, SortGuiObjects)
                        new:SetInstance(guiObjects[1])
                    end
                end
            end
        end
    end)

    return new
end

function SelectionClass:GetInstance(filterClassName)
    if filterClassName == nil then filterClassName = {'Instance'} end
    if type(filterClassName) == 'string' then filterClassName = {filterClassName} end

    local selected = SEL:Get()
    local quantity = #selected
    if quantity == 0 then
        return self.pluginModel.Dialogs.Error(string.format('You must select one instance [%s' .. string.rep(', %s', #filterClassName - 1) .. ']', unpack(filterClassName)))
    elseif quantity > 1 then
        return self.pluginModel.Dialogs.Error(string.format('You can only select one instance [%s' .. string.rep(', %s', #filterClassName - 1) .. ']', unpack(filterClassName)))
    else
        local object = selected[1]
        if IsA(object, filterClassName) then
            return object
        else
            return self.pluginModel.Dialogs.Error(string.format('Selected instance must be of class %s' .. string.rep(', %s', #filterClassName - 1) .. '. Select at least one instance.', unpack(filterClassName)))
        end
    end
end

function SelectionClass:GetInstances(filterClassName, autoFilter)
    if filterClassName == nil then filterClassName = {'Instance'} end
    if type(filterClassName) == 'string' then filterClassName = {filterClassName} end
    if autoFilter == nil then autoFilter = true end

    local selected = SEL:Get()

    if #selected == 0 then
        return self.pluginModel.Dialogs.Error(string.format('You must select at least one instance [%s' .. string.rep(', %s', #filterClassName - 1) .. ']', unpack(filterClassName)))
    end

    local objects = {}

    for _, object in ipairs(selected) do
        if IsA(object, filterClassName) then
            table.insert(objects, object)
        else
            if not autoFilter then
                return self.pluginModel.Dialogs.Error(string.format('All selected instance(s) must be of class %s' .. string.rep(', %s', #filterClassName - 1), unpack(filterClassName)))
            end
        end
    end

    local quantity = #objects
    if quantity == 0 then
        return self.pluginModel.Dialogs.Error(string.format('No selected instance(s) are of class %s' .. string.rep(', %s', #filterClassName - 1) .. '. Select at least one instance.', unpack(filterClassName)))
    else
        return objects
    end
end

function SelectionClass:SetInstance(instance)
    SEL:Set({instance})
end

function SelectionClass:SetInstances(...)
    SEL:Set({...})
end

function SelectionClass:SetInstanceArray(arrayInstance)
    SEL:Set(arrayInstance)
end

return SelectionClass
