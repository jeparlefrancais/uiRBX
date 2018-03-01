local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Set Text',
    1,
    function(pluginModel)
        local objects = pluginModel.Selection:GetInstances{'TextBox', 'TextLabel', 'TextButton'}
        if objects then
            local text = pluginModel.Dialogs.Text('Enter Text', objects[1].Text)
            if text ~= nil then
                for _, obj in ipairs(objects) do
                    obj.Text = text
                end
            end
        end
    end
)
