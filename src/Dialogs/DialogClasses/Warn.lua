local CoreMessage = require(script.Parent.CoreMessage)

local function Warn(msg)
    
    local dialog = CoreMessage('Warning!', msg, 'Ok', Color3.fromRGB(235, 151, 91), Color3.fromRGB(182, 117, 70))
    
    dialog.MainButton.MouseButton1Click:Connect(function()
        dialog.Result:Fire()
    end)

    return dialog
end

return Warn