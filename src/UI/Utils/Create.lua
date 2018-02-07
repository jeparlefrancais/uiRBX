return function (instanceClass)
    local obj = Instance.new(instanceClass)
    return function(properties)
        for key, val in pairs(properties) do
			local success, message = pcall(function()
	            obj[key] = val
			end)
			if not success then
				error('Create function failed with key, value: ' .. tostring(key) .. ', ' .. tostring(val) .. ' with error message: ' .. message)
			end
        end
        return obj
    end
end