local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Toolbar:New(
    'Launch UI Editor',
    'UI Toolkit',
    'Open/Close the Editor',
    'http://www.roblox.com/asset/?id=1428166227',
    1,
    function(pluginModel)
        if pluginModel.Enabled then
            pluginModel:Close()
        else
            pluginModel:Open()
            pluginModel.plugin:Activate(true)
        end
    end
)
