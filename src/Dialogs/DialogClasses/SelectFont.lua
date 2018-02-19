local SelectEnumItem = require(script.Parent.SelectEnumItem)

local function GetFont(name)
    for _, item in ipairs(Enum.Font:GetEnumItems()) do
        if item.Name == name then
            return item
        end
    end
end

local function SelectFont(title)
    local dialog = SelectEnumItem(title, Enum.Font)
    
    dialog.Content.ScrollingContent.SubContent.GridLayout.SortOrder = Enum.SortOrder.Name

    for _, button in ipairs(dialog.Content.ScrollingContent.SubContent:GetChildren()) do
        if button:IsA('TextButton') then
            button.Name = button.Text
            button.Font = GetFont(button.Text)
            button.FrontText.Font = button.Font
        end
    end

    return dialog
end

return SelectFont