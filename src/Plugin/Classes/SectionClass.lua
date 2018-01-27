local SectionClass = {}

function SectionClass:New(name, position)
    local new = setmetatable({}, self)
    self.__index = self
    new.name = name
    new.position = position
    new.size = 0
    new.actions = {}
    return new
end

function SectionClass:AddAction(action)
    table.insert(self.actions, action)
    self.size = self.size + 1
end

function SectionClass:GetActions()
    return self.actions
end

function SectionClass:GetName()
    return self.name
end

function SectionClass:GetPosition()
    return self.position
end

function SectionClass:GetSize()
    return self.size
end

return SectionClass
