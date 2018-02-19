local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Toolbar',
    'View Properties',
    2,
    'UI Toolkit',
    'Open Properties Panel',
    'http://www.roblox.com/asset/?id=1436287004',
    function(pluginModel)
        pluginModel.PropertiesOpened = not pluginModel.PropertiesOpened
        pluginModel.Events.PropertiesOpenedChanged:Fire(pluginModel.PropertiesOpened)
    end
)
