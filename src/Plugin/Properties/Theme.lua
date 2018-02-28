local property = require(script.Parent.Parent.Classes.Properties).StringChoice:New(
    'Theme', -- name
    1, -- order
    { -- choices
        'Default'
    },
    'Default' -- default
)

return property
