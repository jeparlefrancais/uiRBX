return function (instanceClass)
    local obj = Instance.new(instanceClass)
    return function(properties)
        for key, val in pairs(properties) do
            obj[key] = val
        end
        return obj
    end
end