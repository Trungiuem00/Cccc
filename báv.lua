local tool = script.Parent  -- Đảm bảo script này đặt trong Tool (vũ khí)
local damage = 30  -- Sát thương mỗi lần chém
local maxDistance = 10000  -- Khoảng cách tối đa có thể chém

-- Khi Tool được kích hoạt (chuột trái)
tool.Activated:Connect(function()
    local character = tool.Parent
    local root = character:FindFirstChild("HumanoidRootPart")
    
    if root then
        local rayOrigin = root.Position
        local rayDirection = root.CFrame.LookVector * maxDistance
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {character}  -- Không đánh chính mình
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

        local rayResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

        if rayResult and rayResult.Instance then
            local hitPart = rayResult.Instance
            local hitCharacter = hitPart.Parent
            local humanoid = hitCharacter:FindFirstChild("Humanoid")

            if humanoid then
                humanoid:TakeDamage(damage)
                print("Chém trúng kẻ địch từ xa!")

                -- Hiệu ứng chém (tùy chọn)
                local slashEffect = Instance.new("Part")
                slashEffect.Size = Vector3.new(5, 0.5, maxDistance)
                slashEffect.Position = (rayOrigin + rayResult.Position) / 2
                slashEffect.Anchored = true
                slashEffect.Material = Enum.Material.Neon
                slashEffect.Color = Color3.fromRGB(255, 0, 0)
                slashEffect.Parent = workspace

                game.Debris:AddItem(slashEffect, 0.5)  -- Xóa hiệu ứng sau 0.5 giây
            end
        else
            print("Không chém trúng ai!")
        end
    end
end)
