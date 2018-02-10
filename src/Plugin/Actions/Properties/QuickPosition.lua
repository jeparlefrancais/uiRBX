local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Selection',
    'Quick Position',
    2,
    {
        'Center',
        'Center-Left',
        'Center-Right',
        'Top-Left',
        'Top-Center',
        'Top-Right',
        'Bottom-Left',
        'Bottom-Center',
        'Bottom-Right'
    },
    function(subAction, pluginModel)
        local objects = pluginModel.Selection:GetInstances('GuiObject')
        if objects then
            local x, y = 0, 0
            if subAction == 'Center' or subAction == 'Center-Left' or subAction == 'Center-Right' then
                y = .5
            elseif subAction == 'Bottom-Center' or subAction == 'Bottom-Left' or subAction == 'Bottom-Right' then
                y = 1
            end
            if subAction == 'Center' or subAction == 'Top-Center' or subAction == 'Bottom-Center' then
                x = .5
            elseif subAction == 'Center-Right' or subAction == 'Top-Right' or subAction == 'Bottom-Right' then
                x = 1
            end
            for _, obj in ipairs(objects) do
                obj.AnchorPoint = Vector2.new(x, y)
                obj.Position = UDim2.new(x, 0, y, 0)
            end
        end
    end
)