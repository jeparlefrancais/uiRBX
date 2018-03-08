local Create = require(script.Parent.Parent.Parent.UI.Utils.Create)
local CoreCancelButton = require(script.Parent.CoreCancelButton)
local CoreAcceptCancelButtons = require(script.Parent.CoreAcceptCancelButtons)

local function CoreList(title, size, elementsPerPage, acceptButton)
    
    local dialog = acceptButton and CoreAcceptCancelButtons(title) or CoreCancelButton(title)

    local scrollingFrame = Create'ScrollingFrame'{
        Name = 'ScrollingContent',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(1, -12, 1, 0),
        CanvasSize = UDim2.new(0, 0, (size > elementsPerPage and size/elementsPerPage or 1), 0),
        Parent = dialog.Content
    }

    local subContent = Create'Frame'{
        Name = 'SubContent',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, -12, 1, 0),
        Parent = scrollingFrame
    }

    local gridListLayout = Create'UIGridLayout'{
        Name = 'GridLayout',
        CellPadding = UDim2.new(0, 0, 0, 5),
        CellSize = UDim2.new(1, 0, size > elementsPerPage and 1/size or 1/elementsPerPage, -5),
        FillDirection = Enum.FillDirection.Horizontal,
        FillDirectionMaxCells = 1,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = subContent
    }

    return dialog
end

return CoreList
