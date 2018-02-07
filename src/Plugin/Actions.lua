local ActionClass = require(script.Parent.Classes.ActionClass)

return {
    Create = ActionClass:New('Create', function(pluginModel)
        pluginModel.Dialogs.Information('Fired!', 'You fired the "Create" button from the plugin UI.')
    end),
    CopyStyle = ActionClass:New('Copy Style', function(pluginModel)
        pluginModel.Dialogs.Warn('This functionality is not implemented yet.')
    end),
    PasteStyle = ActionClass:New('Paste Style', function(pluginModel)
        pluginModel.Dialogs.Error('You can not use this yet.')
    end),
}