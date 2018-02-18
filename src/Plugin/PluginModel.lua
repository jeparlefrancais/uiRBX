local SectionClass = require(script.Parent.Classes.SectionClass)
local SelectionClass = require(script.Parent.Classes.SelectionClass)

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

for _, folder in ipairs(script.Parent.Actions:GetChildren()) do
    local section = SectionClass:New(folder.Name, Orders[folder.Name])
    for _, actionModule in ipairs(folder:GetChildren()) do
        section:AddAction(require(actionModule))
    end
    table.insert(PluginModel.Sections, section)
end

PluginModel.Dialogs = require(script.Parent.Parent.UI.Dialogs)

PluginModel.Selection = SelectionClass:New(PluginModel)

PluginModel.Enabled = false

-- ADD EVENTS
PluginModel.Events = {
    CloseActionSubMenuOpened = Instance.new('BindableEvent') -- (opt string actionName)
}

return PluginModel
