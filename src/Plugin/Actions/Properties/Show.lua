local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Trigger',
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
