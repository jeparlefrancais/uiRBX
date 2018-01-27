local PluginFolder = script.Parent

local ui = require(PluginFolder.UI.CreateGui)(.025, require(PluginFolder.Plugin.PluginModel))

ui.Parent = game:GetService('Players'):WaitForChild('jeparlefrancais'):WaitForChild('PlayerGui') --game:GetService('CoreGui')


--[[
-- Setup Toolbar
local toolbar = plugin:CreateToolbar('UI Toolkit')
 
-- Setup button
local button = toolbar:CreateButton(
	'Button',
	'Press me'
)
button.Click:Connect(function()

	plugin:Activate(true) -- Neccessary to listen to mouse input
end)
 ]]
