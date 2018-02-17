local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Trigger',
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
