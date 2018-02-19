local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Toolbar',
    'Launch UI Editor',
    1,
    'UI Toolkit',
    'Open/Close the Editor',
    'http://www.roblox.com/asset/?id=1428166227',
    function(pluginModel)
        if pluginModel.Enabled then
            pluginModel:Close()
        else
            pluginModel:Open()
        end
    end
)
