local Create = require(script.Parent.Parent.UI.Utils.Create)
local GetAnimation = require(script.Parent.Parent.UI.Utils.GetAnimation)

local Dialogs = {}
local DialogParent = Create'ScreenGui'{
    Name = 'uiRBXDialogGui',
    DisplayOrder = 10,
    Parent = game:GetService('CoreGui')
}
local Background = Create'TextButton'{
    AnchorPoint = Vector2.new(.5, .5),
	AutoButtonColor = false,
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 1,
    Position = UDim2.new(.5, 0, .5, 0),
    Size = UDim2.new(1, 0, 1, 0),
    Text = '',
    Visible = false,
    Parent = DialogParent
}

local toVisible = GetAnimation(Background, .5, {BackgroundTransparency = .35})
local toInvisible = GetAnimation(Background, .5, {BackgroundTransparency = 1})
toInvisible.Completed:Connect(function(state)
    if state == Enum.PlaybackState.Completed then
        Background.Visible = false
    end
end)

for _, dialog in ipairs(script.Parent.DialogClasses:GetChildren()) do
    local CreateUI = require(dialog)

    Dialogs[dialog.Name] = function(...)
        local ui = CreateUI(...)
        ui.Parent = Background
        Background.Visible = true
        toVisible:Play()
        local result = ui.Result.Event:Wait()
        ui:Destroy()
        toInvisible:Play()
        return result
    end
end

return Dialogs
