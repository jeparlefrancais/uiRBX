local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Toggle',
    'Show Grid',
    3,
    false,
    'Hide Grid',
    function(state, pluginModel)
        pluginModel.Dialogs.Error('This functionality is not implemented yet.')
    end
)
