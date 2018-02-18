local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Toolbar',
    'Launch UI Editor',
    1,
    'UI Toolkit',
    'Open/Close the Editor',
    'rbxassetid://1428166234',
    function(pluginModel)
        if pluginModel.Enabled then
            pluginModel:Close()
        else
            pluginModel:Open()
        end
    end
)
