local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Expand',
    6,
    function(pluginModel)
        local objects = pluginModel.Selection:GetInstances('GuiObject')
        if objects then
            for _, obj in ipairs(objects) do
                obj.Size = UDim2.new(1, 0, 1, 0)
            end
        end
    end
)
