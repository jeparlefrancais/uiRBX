local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Selection:New(
    'List',
    {
        'Vertical',
        'Horizontal'
    },
    1,
    function(subAction, pluginModel)
        pluginModel.Dialogs.Error('This functionality [' .. subAction .. '] is not implemented yet.')
    end
)
