local CoreButton = require(script.Parent.CoreButton)

local function CoreCancelButton(title)
    
    local dialog = CoreButton(title, 'Cancel', Color3.fromRGB(255, 99, 99), Color3.fromRGB(179, 70, 70))

    dialog.MainButton.MouseButton1Click:Connect(function()
        dialog.Result:Fire()
    end)

    return dialog
end

return CoreCancelButton
