function love.load()
    char = love.graphics.newImage("character.png")
    player{50 = "x",50 = "y", 0 = "velx", 0 = "vely",98.1 = "gravity",0 = Dvel = 0}
end

function love.update(dt)
    --if love.keyboard.isDown("g") then velY = -100
    --end
    player.vely = player.vely - (player.gravity * dt)
    player.y = player.y + player.vely * dt
    if y >= 475 then player.gravity = 0 
        else player.gravity = -98.1
    end
    if player.gravity == 0 then player.vely = 0
        else velY = velY
    end
    if love.keyboard.isDown("w") and player.gravity == 0 then player.vely = -200
    end
    if love.keyboard.isDown("a") then player.x = player.x - 100 * dt
    end
    if love.keyboard.isDown("d") then player.x = player.x + 100 * dt
    end
end

function love.draw()
ground = love.graphics.rectangle("fill", 0, 550, 800, 50)
love.graphics.draw(char, x, y)
--charP = love.graphics.rectangle("line", x+23, y+10, 35, 65)
end
