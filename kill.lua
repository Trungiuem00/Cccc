game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        wait(1) -- Đợi nhân vật xuất hiện đầy đủ
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0 -- Giết ngay lập tức
        end
    end)
end)

for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
end

print("💀 Toàn bộ người chơi trong server đã bị tiêu diệt!")
