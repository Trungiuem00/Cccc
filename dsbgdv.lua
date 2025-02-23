local replicatedStorage = game:GetService("ReplicatedStorage")
local event = replicatedStorage:FindFirstChild("KillAllEvent")

local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local button = Instance.new("TextButton", gui)
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Text = "Kill All (Except Me)"
button.Parent = gui

button.MouseButton1Click:Connect(function()
    event:FireServer()
end)
