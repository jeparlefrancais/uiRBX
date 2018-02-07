local ActionClass = require(script.Parent.Classes.ActionClass)

local Sections = {}

for _, section in ipairs(script.Parent.Actions:GetChildren()) do
    Sections[section.Name] = {}
    for _, actionModule in ipairs(section:GetChildren()) do
        table.insert(Sections[section.Name], require(actionModule))
    end
end

return Sections
