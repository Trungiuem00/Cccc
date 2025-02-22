-- Tìm RemoteEvent trong ReplicatedStorage
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KillAllPlayersEvent = ReplicatedStorage:WaitForChild("KillAllPlayers")

-- Hàm để giết tất cả người chơi, trừ người gọi lệnh
local function killAllPlayers(player)
    for _, targetPlayer in pairs(game.Players:GetPlayers()) do
        -- Kiểm tra nếu người gọi lệnh không phải là người chơi này
        if targetPlayer ~= player then
            -- Kiểm tra nếu người chơi có nhân vật và humanoid
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                targetPlayer.Character.Humanoid.Health = 0  -- Giảm sức khỏe xuống 0 (giết người chơi)
            end
        end
    end
end

-- Kết nối hàm killAllPlayers với RemoteEvent
KillAllPlayersEvent.OnServerEvent:Connect(killAllPlayers)
