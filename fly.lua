function love.load()
    -- Khởi tạo nhân vật
    player = {}
    player.x = 200
    player.y = 300
    player.width = 50
    player.height = 50
    player.gravity = 500 -- Trọng lực
    player.lift = -300 -- Lực đẩy khi bay
    player.velocity = 0
end

function love.update(dt)
    -- Áp dụng trọng lực
    player.velocity = player.velocity + player.gravity * dt
    player.y = player.y + player.velocity * dt
    
    -- Không để nhân vật rơi khỏi màn hình
    if player.y > love.graphics.getHeight() - player.height then
        player.y = love.graphics.getHeight() - player.height
        player.velocity = 0
    end
end

function love.draw()
    -- Vẽ nhân vật
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function love.keypressed(key)
    -- Khi nhấn phím Space, nhân vật bay lên
    if key == "space" then
        player.velocity = player.lift
    end
end
