local Create = require(script.Parent.Utils.Create)
local CreateSection = require(script.Parent.Utils.CreateSection)
local CreatePropertiesPanel = require(script.Parent.Utils.CreatePropertiesPanel)
local CreateGrid = require(script.Parent.Utils.CreateGrid)

local function CreateGui(pluginModel)
    local gui = Create'ScreenGui'{
        Name = 'UIRbxEditor',
        Enabled = true,
        Parent = game:GetService('CoreGui')
    }

    local frame = Create'Frame'{
        AnchorPoint = Vector2.new(0, .5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        Position = UDim2.new(0, 0, .5, 0),
        Size = UDim2.new(1, 0, pluginModel:GetProperty('Size'), 0),
        Visible = false,
        Parent = gui
    }

    Create'UIListLayout'{
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, 0),
        Parent = frame,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center
    }

    Create'UIAspectRatioConstraint'{
        AspectRatio = 8,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        DominantAxis = Enum.DominantAxis.Width,
        Parent = frame
    }

    for _, section in ipairs(pluginModel.Sections) do
        CreateSection(section, frame, pluginModel)
    end
    
    -- Create Properties panel
    CreatePropertiesPanel(gui, pluginModel)

    CreateGrid(pluginModel)

    -- EVENT CONNECTIONS
    pluginModel.Events.PluginEnabledChanged.Event:Connect(function(enabled)
        frame.Visible = enabled
    end)

    pluginModel.Events.PropertyChanged.Event:Connect(function(propertyName, value)
        if propertyName == 'Size' then
            frame.Size = UDim2.new(1, 0, value, 0)
        end
    end)

    return gui
end

return CreateGui
