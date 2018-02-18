local property = require(script.Parent.Parent.Classes.NumberPropertyClass):New(
    'Size', -- name
    2, -- order
    .015, -- minimum
    .1, -- maximum
    .005, -- increment
    .001, -- precision
    .025 -- default
)

property:Connect(function(pluginModel)
    -- redraw the UI by firing pluginModel.Events
end)

return property
