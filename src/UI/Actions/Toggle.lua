local GetAnimation = require(script.Parent.Parent.Utils.GetAnimation)

local function CreateToggle(actionButton, action, pluginModel)
    local otherStateColor = Color3.fromRGB(77, 94, 255)
    local toDisabledState = GetAnimation(actionButton, .2, {BackgroundColor3 = actionButton.BackgroundColor3})
    local toEnabledState = GetAnimation(actionButton, .2, {BackgroundColor3 = otherStateColor})
    local toHover = GetAnimation(actionButton, .2, {BackgroundColor3 = Color3.fromRGB(84, 111, 217)})
    
    if action:GetState() then
        actionButton.BackgroundColor3 = otherStateColor
    end

    actionButton.Text = action:GetCurrentName()

    actionButton.MouseEnter:Connect(function() toHover:Play() end)
    actionButton.MouseLeave:Connect(function()
        if action:GetState() then
            toEnabledState:Play()
        else
            toDisabledState:Play()
        end
    end)

    local enabled = false
    actionButton.MouseButton1Click:Connect(function()
        if not enabled then
            enabled = true
            pluginModel.Events.CloseActionSubMenuOpened:Fire()

            action:Fire(pluginModel)
            
            pluginModel.Events.ActionGroupSelected:Fire(action:GetGroupName(), action:GetName())
            wait()
            enabled = false
        end
    end)

    pluginModel.Events.ActionGroupSelected.Event:Connect(function(groupName, selectedActionName)
        if action:HasGroupName(groupName) and action:GetName() ~= selectedActionName then
            action:Disable(pluginModel)
            toDisabledState:Play()
        else
            if action:GetState() then
                toEnabledState:Play()
            else
                toDisabledState:Play()
            end
            actionButton.Text = action:GetCurrentName()
        end
    end)
end

return CreateToggle
