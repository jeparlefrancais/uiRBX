local property = require(script.Parent.Parent.Classes.StringChoicePropertyClass):New(
    'Theme', -- name
    1, -- order
    { -- choices
        'Default'
    },
    'Default' -- default
)

return property
