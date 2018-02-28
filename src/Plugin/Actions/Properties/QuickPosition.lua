local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Quick Position',
    2,
    function(pluginModel)
        local objects = pluginModel.Selection:GetInstances('GuiObject')
        if objects then
            local anchor = pluginModel.Dialogs.AnchorPoint('Select Position')
            if anchor then
                for _, obj in ipairs(objects) do
                    obj.AnchorPoint = anchor
                    obj.Position = UDim2.new(anchor.X, 0, anchor.Y, 0)
                end
            end
        end
    end
)