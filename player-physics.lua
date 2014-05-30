function love.load()
    char = love.graphics.newImage("character.png")
    x = 50
    y = 50
    velX = 0
    velY = 0
    gravity = -98.1
    DvelY = 0
end

function love.update(dt)
    --if love.keyboard.isDown("g") then velY = -100
    --end
    velY = velY - (gravity * dt)
    y = y + velY * dt
    if y >= 475 then gravity = 0 
        else gravity = -98.1
    end
    if gravity == 0 then velY = 0
        else velY = velY
    end
    if love.keyboard.isDown("w") and gravity == 0 then velY = -200
    end
    if love.keyboard.isDown("a") then x = x - 100 * dt
    end
    if love.keyboard.isDown("d") then x = x + 100 * dt
    end
end

function love.draw()
ground = love.graphics.rectangle("fill", 0, 550, 800, 50)
love.graphics.draw(char, x, y)
--charP = love.graphics.rectangle("line", x+23, y+10, 35, 65)
end