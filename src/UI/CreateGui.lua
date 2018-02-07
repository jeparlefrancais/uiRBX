local GetAnimation = require(script.Parent.Utils.GetAnimation)
local Create = require(script.Parent.Utils.Create)
local CreateSection = require(script.Parent.Utils.CreateSection)

local function CreateGui(size, pluginModel)
    local gui = Create'ScreenGui'{Name = 'UIRbxEditor'}

    local frame = Create'Frame'{
        AnchorPoint = Vector2.new(0, .5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        Parent = gui,
        Position = UDim2.new(0, 0, .5, 0),
        Size = UDim2.new(.1, 0, size, 0)
    }

    local listLayout = Create'UIListLayout'{
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, 0),
        Parent = frame,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center
    }

    for _, section in ipairs(pluginModel.Sections) do
        CreateSection(section, frame, pluginModel)
    end

    return gui
end

return CreateGui
