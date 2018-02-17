local Create = require(script.Parent.Parent.Utils.Create)
local SelectElementInList = require(script.Parent.SelectElementInList)

local function SelectEnumItem(title, enumType)
    
    local stringList = {}
    for _, item in ipairs(enumType:GetEnumItems()) do
        table.insert(stringList, item.Name)
    end

    local dialog = SelectElementInList(title, stringList, function(selectedElement)
        for _, item in ipairs(enumType:GetEnumItems()) do
            if selectedElement == item.Name then
                return item
            end
        end
    end)
    
    return dialog
end

return SelectEnumItem