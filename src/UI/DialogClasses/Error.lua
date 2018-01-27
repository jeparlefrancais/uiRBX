local Dialog = Instance.new('Frame')
local Bindable = Instance.new('BindableEvent')
Bindable.Name = 'Result'
Bindable.Parent = Dialog

local function Error(title, msg)
    local dialog = Dialog:Clone()
    -- set title and message
    -- connect button to fire the Bindable
    return dialog
end

return Error