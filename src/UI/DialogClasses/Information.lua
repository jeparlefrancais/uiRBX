local Create = require(script.Parent.Parent.Utils.Create)
local CoreMessage = require(script.Parent.CoreMessage)

local function Information(title, msg)
    
    local dialog = CoreMessage(title, msg, 'Ok')
    
    dialog.MainButton.MouseButton1Click:Connect(function()
        dialog.Result:Fire()
    end)

    return dialog
end

return Information