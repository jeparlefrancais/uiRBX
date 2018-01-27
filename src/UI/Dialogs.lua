local Dialogs = {}

for _, dialog in ipairs(script.Parent:GetChildren()) do
    CreateUI = require(dialog)

    local function Dialogs[dialog.Name](...)
        local ui = CreateUI(...)
        result = ui.Result:Wait()
        ui:Destroy()
        return result
    end
end

return Dialogs
