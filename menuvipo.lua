local auraButton = script.Parent:FindFirstChild("AuraButton")
local rangeButton = script.Parent:FindFirstChild("RangeButton")
local damageButton = script.Parent:FindFirstChild("DamageButton")

local function toggleScript(eventName, button)
    local state = button.Text == "BẬT" and true or false
    game.ReplicatedStorage:FindFirstChild(eventName):FireServer(state)
    button.Text = state and "TẮT" or "BẬT"
end

auraButton.MouseButton1Click:Connect(function()
    toggleScript("AuraToggleEvent", auraButton)
end)

rangeButton.MouseButton1Click:Connect(function()
    toggleScript("RangeAttackEvent", rangeButton)
end)

damageButton.MouseButton1Click:Connect(function()
    toggleScript("DamageBoostEvent", damageButton)
end)
