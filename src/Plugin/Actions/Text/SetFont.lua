local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Set Font',
    3,
    function(pluginModel)
        local objects = pluginModel.Selection:GetInstances{'TextBox', 'TextLabel', 'TextButton'}
        if objects then
            local font = pluginModel.Dialogs.SelectFont('Select New Font')
            if font then
                for _, obj in ipairs(objects) do
                    obj.Font = font
                end
            end
        end
    end
)
