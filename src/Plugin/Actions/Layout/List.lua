local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Selection',
    'List',
    1,
    {
        'Vertical',
        'Horizontal'
    },
    function(subAction, pluginModel)
        pluginModel.Dialogs.Error('This functionality [' .. subAction .. '] is not implemented yet.')
    end
)
