local Properties = {}

for _, property in ipairs(script.Parent.PropertyClasses:GetChildren()) do
    Properties[property.Name] = require(property)
end

return Properties
