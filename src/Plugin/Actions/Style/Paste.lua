local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Paste Style',
    2,
    function(pluginModel)
        if pluginModel.StyleManager:HasCopiedStyle() then
            local objects = pluginModel.Selection:GetInstances('GuiObject')
            if objects then
                for _, obj in ipairs(objects) do
                    pluginModel.StyleManager:PasteStyle(obj)
                end
            end
        else
            pluginModel.Dialogs.Warn('You need to copy a style first.')
        end
    end
)
