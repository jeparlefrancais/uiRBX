local SectionClass = require(script.Parent.Classes.SectionClass)
local Actions = require(script.Parent.Actions)

local Sections = {
    Global = SectionClass:New('Global', 1),
    Properties = SectionClass:New('Properties', 2),
    Layout = SectionClass:New('Layout', 3),
    Text = SectionClass:New('Layout', 4),
    Style = SectionClass:New('Style', 5)
}

-- GLOBAL SECTION
Sections.Global:AddAction(Actions.Create)
Sections.Global:AddAction(Actions.Convert)
Sections.Global:AddAction(Actions.GridSize)
Sections.Global:AddAction(Actions.ShowGrid)

-- PROPERTIES
Sections.Properties:AddAction(Actions.Position)
Sections.Properties:AddAction(Actions.QuickPosition)
Sections.Properties:AddAction(Actions.Size)
Sections.Properties:AddAction(Actions.Visible)

-- LAYOUT
Sections.Layout:AddAction(Actions.List)
Sections.Layout:AddAction(Actions.Grid)
Sections.Layout:AddAction(Actions.Padding)
Sections.Layout:AddAction(Actions.PageLayout)
Sections.Layout:AddAction(Actions.AspectRatio)

-- TEXT
Sections.Text:AddAction(Actions.SetText)
Sections.Text:AddAction(Actions.AlignText)
Sections.Text:AddAction(Actions.SetFont)
Sections.Text:AddAction(Actions.AddShadow)

-- STYLE SECTION
Sections.Style:AddAction(Actions.CopyStyle)
Sections.Style:AddAction(Actions.PasteStyle)


-- CREATE MODEL
local PluginModel = {}

PluginModel.Sections = Sections
PluginModel.Dialogs = require(script.Parent.Parent.UI.Dialogs)

return PluginModel
