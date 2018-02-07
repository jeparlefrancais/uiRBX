local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Selection',
    'Align Text',
    2,
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
        pluginModel.Dialogs.Error('This functionality [' .. subAction .. '] is not implemented yet.')
    end
)
