local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Selection:New(
    'Grid Anchor',
    {
        'Center',
        'Center-Left',
        'Center-Right',
        'Top-Left',
        'Top-Center',
        'Top-Right',
        'Bottom-Left',
        'Bottom-Center',
        'Bottom-Right'
    },
    5,
    function(subAction, pluginModel)
        pluginModel.Dialogs.Error('This functionality is not implemented yet.')
    end
)