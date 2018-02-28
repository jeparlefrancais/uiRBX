local Actions = require(script.Parent.Parent.Parent.Classes.Actions)

return Actions.Toggle:New(
    'Grid Environment',
    'Local Grid',
    'Global Grid',
    true,
    'GridGroup',
    3,
    function(state, pluginModel)
        if state then
            pluginModel.Selection.Grid:SetLocal()
        else
            pluginModel.Selection.Grid:SetGlobal()
        end
    end
)
