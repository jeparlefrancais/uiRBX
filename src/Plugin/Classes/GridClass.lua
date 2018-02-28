local function GetRay(x, y)
    return math.sqrt(x * x + y * y)
end

local GridClass = {}

function GridClass:New(pluginModel)
    local new = setmetatable({}, self)
    self.__index = self
    
    new.anchorPosition = UDim2.new(.5, 0, .5, 0)
    new.size = UDim2.new(.2, 0, .2, 0)
    new.enabled = false
    new.plugin = pluginModel
    new.screenGui = nil
    new.free = false
    new.global = false

    return new
end

function GridClass:GetBestPosition(mouseX, mouseY, parentPosition, parentSize)
    if self.screenGui then
        if self.free then
            return UDim2.new(mouseX / self.screenGui.AbsoluteSize.X, 0, mouseY / self.screenGui.AbsoluteSize.Y, 0)
        else
            local closest = nil
            local distance = math.huge
            for _, point in ipairs(self.screenGui.Container:GetChildren()) do
                local pointDistance = GetRay(
                    point.AbsolutePosition.X + (point.AbsoluteSize.X/2) - mouseX,
                    point.AbsolutePosition.Y + (point.AbsoluteSize.Y/2) - mouseY
                )
                if pointDistance < distance then
                    closest = point
                    distance = pointDistance
                end
            end
            if self.global then
                local pointX = closest.AbsolutePosition.X + (closest.AbsoluteSize.X/2)
                local pointY = closest.AbsolutePosition.Y + (closest.AbsoluteSize.Y/2)
                return UDim2.new((pointX - parentPosition.X) / parentSize.X, 0, (pointY - parentPosition.Y) / parentSize.Y, 0)
            else
                return closest.Position
            end
        end
    end
end

function GridClass:SetGui(screenGui)
    self.screenGui = screenGui
end

function GridClass:SetAnchorPosition(anchorUDim2)
    if self.anchorPosition ~= anchorUDim2 then
        self.anchorPosition = anchorUDim2
        self.plugin.Events.GridChanged:Fire()
    end
end

function GridClass:SetSize(sizeUDim2)
    if self.size ~= sizeUDim2 then
        self.size = sizeUDim2
        self.plugin.Events.GridChanged:Fire()
    end
end

function GridClass:SetGlobal()
    self.global = true
    self.plugin.Events.GridEnvironmentChanged:Fire()
end

function GridClass:SetLocal()
    self.global = false
end

function GridClass:GetAnchorPosition()
    return self.anchorPosition
end

function GridClass:GetSize()
    return self.size
end

function GridClass:IsGlobal()
    return self.global
end

function GridClass:IsFree()
    return self.free
end

function GridClass:IsEnabled()
    return self.enabled
end

function GridClass:Enable()
    if not self.enabled then
        self.enabled = true
        self.plugin.Events.GridEnabledChanged:Fire(self.enabled)
    end
end

function GridClass:Disable()
    if self.enabled then
        self.enabled = false
        self.plugin.Events.GridEnabledChanged:Fire(self.enabled)
    end
end

function GridClass:SetSize(udim2Size)
    self.size = udim2Size
    
end

return GridClass
