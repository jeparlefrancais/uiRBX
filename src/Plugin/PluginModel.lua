local SectionClass = require(script.Parent.Classes.SectionClass)
local Sections = require(script.Parent.Sections)

-- PARAMETERS
local Orders = {
    Global = 1,
    Properties = 2,
    Text = 3,
    Layout = 4,
    Style = 5
}

-- CREATE MODEL
local PluginModel = {}

-- ADD SECTIONS
PluginModel.Sections = {}

for name, actionList in pairs(Sections) do
    local section = SectionClass:New(name, Orders[name])
    for _, action in ipairs(actionList) do
        section:AddAction(action)
    end
    table.insert(PluginModel.Sections, section)
end

PluginModel.Dialogs = require(script.Parent.Parent.UI.Dialogs)

return PluginModel
