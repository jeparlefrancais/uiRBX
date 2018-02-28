local Create = require(script.Parent.Utils.Create)

local GRID_POINT_MARGE = 24
local MAX_INDEX = 15

local function MultiplyUDim2(udim2, multiplicator)
    return UDim2.new(udim2.X.Scale * multiplicator, udim2.X.Offset * multiplicator,
    udim2.Y.Scale * multiplicator, udim2.Y.Offset * multiplicator)
end

local function CreateGridPoint(container, basePoint, index, increment)
    local new = basePoint:Clone()
    new.Parent = container
    new.Position = new.Position + MultiplyUDim2(increment, index)
    return new
end

local function CreateGrid(pluginModel)

    local gridGui = Create'ScreenGui'{
        Name = 'UIRbxGrid',
        Enabled = true,
        DisplayOrder = 2,
        Parent = game:GetService('CoreGui')
    }
    local container = Create'Frame'{
        Name = 'Container',
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = gridGui
    }

    pluginModel.Selection.Grid:SetGui(gridGui)

    local gridPoint = Create'ImageLabel'{
        Name = 'GridPoint',
        AnchorPoint = Vector2.new(.5, .5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 24, 0, 24),
        Image = 'rbxassetid://1450339834',
        Visible = false -- get plugin property
    }

    pluginModel.Events.GridChanged.Event:Connect(function()
        container:ClearAllChildren()

        if not pluginModel.Selection.Grid:IsFree() then
            local basePoint = gridPoint:Clone()
            basePoint.Visible = pluginModel.Selection.Grid:IsEnabled()
            basePoint.Position = pluginModel.Selection.Grid:GetAnchorPosition()
            basePoint.Parent = container

            local size = pluginModel.Selection.Grid:GetSize()
            local XSizeIncrement = UDim2.new(size.X.Scale, size.X.Offset, 0, 0)
            local YSizeIncrement = UDim2.new(0, 0, size.Y.Scale, size.Y.Offset)

            local index = 1

            local nextPoint = CreateGridPoint(container, basePoint, index, XSizeIncrement)

            local horizontalPoints = {}

            while nextPoint.AbsolutePosition.X < container.AbsolutePosition.X + container.AbsoluteSize.X + GRID_POINT_MARGE and index < MAX_INDEX do
                table.insert(horizontalPoints, nextPoint)
                index = index + 1
                nextPoint = CreateGridPoint(container, basePoint, index, XSizeIncrement)
            end
            nextPoint:Destroy()

            index = -1
            nextPoint = CreateGridPoint(container, basePoint, index, XSizeIncrement)

            while nextPoint.AbsolutePosition.X > container.AbsolutePosition.X - GRID_POINT_MARGE and index > -MAX_INDEX do
                table.insert(horizontalPoints, nextPoint)
                index = index - 1
                nextPoint = CreateGridPoint(container, basePoint, index, XSizeIncrement)
            end
            nextPoint:Destroy()

            index = 1
            nextPoint = CreateGridPoint(container, basePoint, index, YSizeIncrement)

            while nextPoint.AbsolutePosition.Y < container.AbsolutePosition.Y + container.AbsoluteSize.Y + GRID_POINT_MARGE and index < MAX_INDEX do
                for _, xPoint in ipairs(horizontalPoints) do
                    CreateGridPoint(container, xPoint, index, YSizeIncrement)
                end
                index = index + 1
                nextPoint = CreateGridPoint(container, basePoint, index, YSizeIncrement)
            end
            nextPoint:Destroy()

            index = -1
            nextPoint = CreateGridPoint(container, basePoint, index, YSizeIncrement)

            while nextPoint.AbsolutePosition.Y > container.AbsolutePosition.Y - GRID_POINT_MARGE and index > -MAX_INDEX do
                for _, xPoint in ipairs(horizontalPoints) do
                    CreateGridPoint(container, xPoint, index, YSizeIncrement)
                end
                index = index - 1
                nextPoint = CreateGridPoint(container, basePoint, index, YSizeIncrement)
            end
            nextPoint:Destroy()
        end
    end)

    local fullSize = UDim2.new(1, 0, 1, 0)
    local basePosition = UDim2.new(0, 0, 0, 0)
    pluginModel.Events.GridEnvironmentChanged.Event:Connect(function(localGuiObject)
        if localGuiObject == nil then
            if container.Size ~= fullSize or container.Position ~= basePosition then
                container.Size = fullSize
                container.Position = basePosition
                pluginModel.Events.GridChanged:Fire()
            end
        else
            local goalSize = UDim2.new(0, localGuiObject.AbsoluteSize.X, 0, localGuiObject.AbsoluteSize.Y)
            local goalPosition = UDim2.new(0, localGuiObject.AbsolutePosition.X, 0, localGuiObject.AbsolutePosition.Y)
            if container.Size ~= goalSize or container.Position ~= goalPosition then
                container.Size = goalSize
                container.Position = goalPosition
                pluginModel.Events.GridChanged:Fire()
            end
        end
    end)

    pluginModel.Events.GridEnabledChanged.Event:Connect(function(enabled)
        for _, point in ipairs(container:GetChildren()) do
            point.Visible = enabled
        end
    end)

    gridGui.Changed:Connect(function(property)
        if property == 'AbsoluteSize' or property == 'AbsolutePosition' then
            pluginModel.Events.GridChanged:Fire()
        end
    end)
end

return CreateGrid
