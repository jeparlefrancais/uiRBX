local property = require(script.Parent.Parent.Classes.StringChoicePropertyClass):New(
    'Theme', -- name
    1, -- order
    { -- choices
        'Default'
    },
    'Default' -- default
)

property:Connect(function(pluginModel)
    -- redraw the UI by firing pluginModel.Events
end)

return property
