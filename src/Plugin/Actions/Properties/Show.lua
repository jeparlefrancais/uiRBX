local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Trigger',
    'Show',
    4,
    function(pluginModel)
        local obj = pluginModel.Selection:GetInstance('GuiObject')
        if obj then
            obj.Visible = true
        end
    end
)
