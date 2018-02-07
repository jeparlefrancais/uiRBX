local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Trigger',
    'Padding',
    3,
    function(pluginModel)
        pluginModel.Dialogs.Error('This functionality is not implemented yet.')
    end
)
