local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

local InstanceList = {
    'Frame',
    'TextLabel',
    'TextButton',
    'TextBox',
    'ImageLabel',
    'ImageButton',
    'ScrollingFrame',
    'ScreenGui'
}

return ActionClass:New(
    'Trigger',
    'Insert',
    1,
    function(pluginModel)
        local parent = pluginModel.Selection:GetInstance()
        if parent then
            local newClass = pluginModel.Dialogs.SelectElementInList('Select a Class', InstanceList)
            if newClass then
                local object = Instance.new(newClass)
                object.Parent = parent
                pluginModel.Selection:SetInstance(object)
            end
        end
    end
)
