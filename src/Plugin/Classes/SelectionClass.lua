local SEL = game:GetService('Selection')

local SelectionClass = {}

function SelectionClass:New(pluginModel)
    local new = setmetatable({}, self)
    self.__index = self
    
    new.pluginModel = pluginModel

    return new
end

function SelectionClass:GetInstance(filterClassName)
    if filterClassName == nil then filterClassName = 'Instance' end

    local selected = SEL:Get()
    local quantity = #selected
    if quantity == 0 then
        return self.pluginModel.Dialogs.Error(string.format('You must select one instance [%s]', filterClassName))
    elseif quantity > 1 then
        return self.pluginModel.Dialogs.Error(string.format('You can only select one instance [%s]', filterClassName))
    else
        local object = selected[1]
        if object:IsA(filterClassName) then
            return object
        else
            return self.pluginModel.Dialogs.Error(string.format('Selected instance must be of class %s', filterClassName))
        end
    end
end

function SelectionClass:GetInstances(filterClassName, autoFilter)
    if filterClassName == nil then filterClassName = 'Instance' end
    if autoFilter == nil then autoFilter = true end

    local selected = SEL:Get()

    if #selected > 0 then
        return self.pluginModel.Dialogs.Error(string.format('You must select at least one instance [%s]', filterClassName))
    end

    local objects = {}

    for _, object in ipairs(selected) do
        if object:IsA(filterClassName) then
            table.insert(objects, object)
        else
            if not autoFilter then
                return self.pluginModel.Dialogs.Error(string.format('All selected instance(s) must be of class %s', filterClassName))
            end
        end
    end

    local quantity = #objects
    if quantity == 0 then
        return self.pluginModel.Dialogs.Error(string.format('No selected instance(s) are of class %s. Select at least one instance.', filterClassName))
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

function SelectionClass:SetArray(arrayInstance)
    SEL:Set(arrayInstance)
end

return SelectionClass
