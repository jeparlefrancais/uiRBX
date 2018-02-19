local property = require(script.Parent.Parent.Classes.NumberPropertyClass):New(
    'Size', -- name
    2, -- order
    .015, -- minimum
    .04, -- maximum
    .001, -- increment
    3, -- precision (digits after comma)
    .025 -- default
)

return property
