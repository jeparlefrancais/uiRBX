local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Toggle:New(
    'Move',
    'Move',
    'Move',
    false,
    'ToolsGroup',
    2,
    function(state, pluginModel)
        if state then
            pluginModel.Selection:EnableDrag()
        else
            pluginModel.Selection:DisableDrag()
        end
    end
)
