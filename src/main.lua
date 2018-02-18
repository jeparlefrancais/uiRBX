local PluginFolder = script.Parent
local PluginClass = require(PluginFolder.Plugin.Classes.PluginClass)

-- PARAMETERS
local Orders = {
    Global = 1,
    Properties = 2,
    Text = 3,
    Layout = 4,
    Style = 5
}

local Plugin = PluginClass:New(plugin)

for _, folder in ipairs(PluginFolder.Plugin.Actions:GetChildren()) do
    if folder.Name == 'Toolbar' then
        for _, actionModule in ipairs(folder:GetChildren()) do
            Plugin:AddToolbarAction(require(actionModule))
        end
	else
		local section = Plugin:AddSection(folder.Name, Orders[folder.Name])
        for _, actionModule in ipairs(folder:GetChildren()) do
            section:AddAction(require(actionModule))
        end
    end
end

Plugin:AddEvent('CloseActionSubMenuOpened') -- (opt string actionName)

local ui = require(PluginFolder.UI.CreateGui)(.025, Plugin)
