local CoreMessage = require(script.Parent.CoreMessage)

local function Error(msg)
    
    local dialog = CoreMessage('Error!', msg, 'Ok', Color3.fromRGB(255, 99, 99), Color3.fromRGB(179, 70, 70))
    
    dialog.MainButton.MouseButton1Click:Connect(function()
        dialog.Result:Fire()
    end)

    return dialog
end

return Error