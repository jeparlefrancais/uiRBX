local Create = require(script.Parent.Utils.Create)
local GetAnimation = require(script.Parent.Utils.GetAnimation)
local SetHoverAnimation = require(script.Parent.Utils.SetHoverAnimation)

local CreateActionType = {}
for _, createActionModule in ipairs(script.Parent.Actions:GetChildren()) do
    CreateActionType[createActionModule.Name] = require(createActionModule)
end

local function CreateActionButton(action, actionButtonSize, pluginModel)
    local actionButton = Create'TextButton'{
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(99, 128, 255),
        BorderSizePixel = 0,
        Font = Enum.Font.SourceSans,
        LayoutOrder = action:GetOrder(),
        Name = action:GetName() .. 'Button',
        Size = UDim2.new(1, 0, actionButtonSize, 0),
        Text = action:GetName(),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true
    }

    CreateActionType[action:GetType()](actionButton, action, pluginModel)
    
    return actionButton
end

return CreateActionButton
