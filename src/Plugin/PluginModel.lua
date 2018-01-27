local SectionClass = require(script.Parent.Classes.SectionClass)
local Actions = require(script.Parent.Actions)

local Sections = {
    Global = SectionClass:New('Global', 1),
    Style = SectionClass:New('Style', 2)
}

-- GLOBAL SECTION
Sections.Global:AddAction(Actions.Create)

-- STYLE SECTION
Sections.Style:AddAction(Actions.CopyStyle)
Sections.Style:AddAction(Actions.PasteStyle)


-- CREATE MODEL
local PluginModel = {}

PluginModel.Sections = Sections

return PluginModel
