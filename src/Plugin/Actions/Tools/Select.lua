local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Toggle',
    'Select',
    1,
    true,
    'Select',
    function(state, pluginModel)
        if state then
            pluginModel.Selection:EnableUISelection()
        else
            pluginModel.Selection:DisableUISelection()
        end
    end
)
