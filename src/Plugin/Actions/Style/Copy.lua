local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Copy Style',
    1,
    function(pluginModel)
        local guiObject = pluginModel.Selection:GetInstance('GuiObject')
        if guiObject then
            pluginModel.StyleManager:CopyStyle(guiObject)
        end
    end
)