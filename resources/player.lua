require "resources/platforms"
require "resources/camera"
--define player 
--p is the table used to store all the player variables
p = {x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() - 125, vy = 0, w = 0, h = 0, ground = 0,char = love.graphics.newImage("resources/character.png")}

p.w = p.char:getWidth ()
p.h = p.char:getHeight ()
gravity = -400

--move the player around and make him jump
function move (dt)
	--update y
	p.y = p.y - p.vy * dt
	--apply gravitational force on the player
	p.vy = p.vy + gravity * dt
	if p.ground == 1 then
		if love.keyboard.isDown(" ") or love.keyboard.isDown("w") or love.keyboard.isDown("up") then 
			p.y = p.y - 10
			p.ground = 0
			p.vy = 250
		end
	end
	if love.keyboard.isDown("a") or love.keyboard.isDown("left") then p.x = p.x - 100 * dt
	end
	if love.keyboard.isDown("d") or love.keyboard.isDown("right") then p.x = p.x + 100 * dt
	end
end

--collision detection
	function collide ()
		for i,v in ipairs (g) do 
			if p.x + p.w / 2 > v.x and p.x + p.w / 2 < v.x + v.w 
				and p.y + p.h >= v.y and p.y + p.h <= v.y + 5 
				then 
					p.ground = 1
					p.vy = 0
			end
		end
	end

-- adding game over
function check_death ()
	if p.y > camera.y + love.graphics.getHeight() then
		love.event.quit()
	end
end


--PARENT FUNCTIONS
function PLAYER_UPDATE (dt)
	move (dt)
	collide ()
	check_death ()
end

function PLAYER_DRAW ()
	love.graphics.draw(p.char, p.x, p.y)
end