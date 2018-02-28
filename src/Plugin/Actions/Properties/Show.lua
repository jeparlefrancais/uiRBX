local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Show',
    4,
    function(pluginModel)
        local objects = pluginModel.Selection:GetInstances('GuiObject')
        if objects then
            for _, obj in ipairs(objects) do
                obj.Visible = true
            end
        end
    end
)
