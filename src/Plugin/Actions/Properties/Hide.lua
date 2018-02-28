local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Hide',
    5,
    function(pluginModel)
        local objects = pluginModel.Selection:GetInstances('GuiObject')
        if objects then
            for _, obj in ipairs(objects) do
                obj.Visible = false
            end
        end
    end
)
