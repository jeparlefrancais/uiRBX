local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Grid',
    2,
    function(pluginModel)
        pluginModel.Dialogs.Error('This functionality is not implemented yet.')
    end
)
