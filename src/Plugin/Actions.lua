local ActionClass = require(script.Parent.Classes.ActionClass)

return {
    Create = ActionClass:New('Create', function() print('Create fired') end),
    CopyStyle = ActionClass:New('Copy Style', function() print('Copy Style fired') end),
    PasteStyle = ActionClass:New('Paste Style', function() print('Paste Style fired') end),
}