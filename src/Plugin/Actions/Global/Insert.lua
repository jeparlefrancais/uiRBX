local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

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

return Actions.Trigger:New(
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
