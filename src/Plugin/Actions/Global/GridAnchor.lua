local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Selection',
    'Grid Anchor',
    5,
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
    function(subAction, pluginModel)
        pluginModel.Dialogs.Error('This functionality is not implemented yet.')
    end
)