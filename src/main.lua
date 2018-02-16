local PluginFolder = script.Parent

local ui = require(PluginFolder.UI.CreateGui)(.025, require(PluginFolder.Plugin.PluginModel))

ui.Enabled = false
ui.Parent = game:GetService('CoreGui')

-- Setup Toolbar
local toolbar = plugin:CreateToolbar('UI Toolkit')
 
-- Setup button
local button = toolbar:CreateButton(
	'Launch UI Editor',
	'Open/Close the Editor',
	'rbxassetid://1428166234'
)
button.Click:Connect(function()
	ui.Enabled = not ui.Enabled
end)
 