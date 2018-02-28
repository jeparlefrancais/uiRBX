local Actions = {}

for _, action in ipairs(script.Parent.ActionClasses:GetChildren()) do
    Actions[action.Name] = require(action)
end

return Actions
