local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Toggle:New(
    'Select',
    'Select',
    'Select',
    true,
    'ToolsGroup',
    1,
    function(state, pluginModel)
        if state then
            pluginModel.Selection:EnableUISelection()
        else
            pluginModel.Selection:DisableUISelection()
        end
    end
)
