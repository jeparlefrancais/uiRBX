local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Toolbar:New(
    'View Properties',
    'UI Toolkit',
    'Open Properties Panel',
    'http://www.roblox.com/asset/?id=1436287004',
    2,
    function(pluginModel)
        pluginModel.PropertiesOpened = not pluginModel.PropertiesOpened
        pluginModel.Events.PropertiesOpenedChanged:Fire(pluginModel.PropertiesOpened)
    end
)
