local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Trigger',
    'Size',
    3,
    function(pluginModel)
        pluginModel.Dialogs.Error('This functionality is not implemented yet.')
    end
)
