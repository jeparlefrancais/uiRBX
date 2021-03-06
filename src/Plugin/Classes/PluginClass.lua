local SectionClass = require(script.Parent.SectionClass)
local SelectionClass = require(script.Parent.SelectionClass)
local StyleManagerClass = require(script.Parent.StyleManagerClass)

local PluginClass = {}

function PluginClass:New(plugin)
    local new = setmetatable({}, self)
    self.__index = self

    new.plugin = plugin
    new.toolbar = {}

    new.Dialogs = require(script.Parent.Parent.Parent.Dialogs.Dialogs)
    new.Sections = {}
    new.Selection = SelectionClass:New(new)
    new.StyleManager = StyleManagerClass:New(new)
    new.Enabled = false
    new.PropertiesOpened = false
    new.Events = {}
    new.Properties = {}

    new:AddEvent('PluginEnabledChanged') -- (bool enabled)
    new:AddEvent('ActionGroupSelected') -- (string groupName, string selectedActionName)
    new:AddEvent('GridEnabledChanged') -- (bool enabled)
    new:AddEvent('GridChanged') -- ()
    new:AddEvent('GridEnvironmentChanged') -- (opt GuiObject localGuiObject)
    new:AddEvent('PropertyChanged') -- (string propertyName, value)
    new:AddEvent('PropertiesOpenedChanged') --(bool enabled)

    return new
end

function PluginClass:AddEvent(eventName)
    self.Events[eventName] = Instance.new('BindableEvent')
end

function PluginClass:AddProperty(property)
    self.Properties[property:GetName()] = property
    property:SetPlugin(self)
end

function PluginClass:GetProperty(propertyName)
    return self.Properties[propertyName]:Get()
end

function PluginClass:AddSection(sectionName, order)
    local section = SectionClass:New(sectionName, order)
    table.insert(self.Sections, section)
    return section
end

function PluginClass:AddToolbarAction(action)
    local toolbarName = action:GetToolbarName()
    if self.toolbar[toolbarName] == nil then
        self.toolbar[toolbarName] = self.plugin:CreateToolbar(toolbarName)
    end
    
    local button = self.toolbar[toolbarName]:CreateButton(
        action:GetName(),
        action:GetTip(),
        action:GetImage()
    )

    button.Click:Connect(function()
        action:Fire(self)
    end)
end

function PluginClass:Open()
    self.Enabled = true
    self.Events.PluginEnabledChanged:Fire(true)
end

function PluginClass:Close()
    self.Enabled = false
    self.Events.PluginEnabledChanged:Fire(false)
end

return PluginClass
