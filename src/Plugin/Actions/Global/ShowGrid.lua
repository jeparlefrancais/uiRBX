local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Toggle',
    'Grid [off]',
    3,
    false,
    'Grid [on]',
    function(state, pluginModel)
        pluginModel.Dialogs.Error('This functionality is not implemented yet.')
    end
)
