local CorePropertyClass = require(script.Parent.CorePropertyClass)

local NumberPropertyClass = {}

function NumberPropertyClass.__index(obj, key) -- allow inheritance
    return NumberPropertyClass[key] or CorePropertyClass[key]
end

function NumberPropertyClass:New(name, order, minimum, maximum, increment, precision, default)
    local new = setmetatable(CorePropertyClass:New('Number', name, order, default), self)
    new.minimum = minimum
    new.maximum = maximum
    new.increment = increment
    new.precision = precision
    return new
end

function NumberPropertyClass:GetMinimum()
    return self.minimum
end

function NumberPropertyClass:GetMaximum()
    return self.maximum
end

function NumberPropertyClass:GetPrecision()
    return self.precision
end

function NumberPropertyClass:Increase()
    local newValue = self:Get() + self.increment
    if newValue > self.maximum then
        newValue = self.maximum
    end
    self:Set(newValue)
end

function NumberPropertyClass:Decrease()
    local newValue = self:Get() - self.increment
    if newValue < self.minimum then
        newValue = self.minimum
    end
    self:Set(newValue)
end

function NumberPropertyClass:Set(value)
    local precision = math.pow(10, -self.precision)
    value = math.floor(value / precision) * precision
    CorePropertyClass.Set(self, value)
end

return NumberPropertyClass
