local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Trigger:New(
    'Grid Anchor',
    5,
    function(pluginModel)
        local anchor = pluginModel.Dialogs.AnchorPoint('Select Grid Anchor')
        if anchor then
            pluginModel.Selection.Grid:SetAnchorPosition(UDim2.new(anchor.X, 0, anchor.Y))
        end
    end
)