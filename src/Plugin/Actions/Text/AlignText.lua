local ActionClass = require(script.Parent.Parent.Parent.Classes.ActionClass)

return ActionClass:New(
    'Selection',
    'Align Text',
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
        local objects = pluginModel.Selection:GetInstances{'TextBox', 'TextLabel', 'TextButton'}
        local x, y = Enum.TextXAlignment.Left, Enum.TextYAlignment.Top
        if subAction == 'Center' or subAction == 'Center-Left' or subAction == 'Center-Right' then
            y = Enum.TextYAlignment.Center
        elseif subAction == 'Bottom-Center' or subAction == 'Bottom-Left' or subAction == 'Bottom-Right' then
            y = Enum.TextYAlignment.Bottom
        end
        if subAction == 'Center' or subAction == 'Top-Center' or subAction == 'Bottom-Center' then
            x = Enum.TextXAlignment.Center
        elseif subAction == 'Center-Left' or subAction == 'Top-Left' or subAction == 'Bottom-Left' then
            x = Enum.TextXAlignment.Right
        end
        for _, obj in ipairs(objects) do
            obj.TextXAlignment = x
            obj.TextYAlignment = y
        end
    end
)
