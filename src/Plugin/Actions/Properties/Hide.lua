local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Trigger',
    'Hide',
    5,
    function(pluginModel)
        local obj = pluginModel.Selection:GetInstance('GuiObject')
        if obj then
            obj.Visible = false
        end
    end
)
