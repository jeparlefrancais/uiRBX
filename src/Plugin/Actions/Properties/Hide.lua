local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Trigger',
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
