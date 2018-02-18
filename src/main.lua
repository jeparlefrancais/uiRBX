local PluginFolder = script.Parent
local PluginClass = require(PluginFolder.Plugin.Classes.PluginClass)

-- PARAMETERS
local Orders = {
	Global = 1,
	Tools = 2,
    Properties = 3,
    Text = 4,
    Layout = 5,
    Style = 6
}

local Plugin = PluginClass:New(plugin)

for _, folder in ipairs(PluginFolder.Plugin.Actions:GetChildren()) do
    local section = nil
    for _, actionModule in ipairs(folder:GetChildren()) do
        local action = require(actionModule)
        if action:GetType() == 'Toolbar' then
            Plugin:AddToolbarAction(require(actionModule))
        else
            if section == nil then
                section = Plugin:AddSection(folder.Name, Orders[folder.Name])
            end
            section:AddAction(action)
        end
    end
end

-- PROPERTIES
for _, property in ipairs(PluginFolder.Plugin.Properties:GetChildren()) do
    Plugin:AddProperty(require(property))
end

-- EVENTS
Plugin:AddEvent('CloseActionSubMenuOpened') -- (opt string actionName)

local ui = require(PluginFolder.UI.CreateGui)(Plugin)
