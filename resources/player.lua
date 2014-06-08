require "resources/platforms"
require "resources/camera"
require "resources/extras"
--define player 
--p is the table used to store all the player variables
p = {x = love.graphics.getWidth() / 2, y = 0, vy = 1, h = 50, w = 50, ground = 0, inc = 0}
p.y = love.graphics.getHeight() - plat:getHeight () - p.h
--p.w = p.char:getWidth ()
--p.h = p.char:getHeight ()
gravity = -400

--move the player around and make him jump
function move (dt)
	--update y
	if pause == "false" then
	p.y = p.y - p.vy * dt
	--apply gravitational force on the player
	p.vy = p.vy + gravity * dt
	--print (p.vy)
	gravity = -400 - p.inc*3.5
	--print (gravity)
	if p.ground == 1 then
		if love.keyboard.isDown(" ") or love.keyboard.isDown("w") or love.keyboard.isDown("up") then 
			p.y = p.y - 10
			p.ground = 0
			if math.floor(number / 10 + 0.5) < 5500 then
				p.inc = math.floor(number / 10 + 0.5) / 10 
			else
				p.inc = 550
			end
			--print (p.inc)
			p.vy = p.inc + 400
		end
	end
	if love.keyboard.isDown("a") or love.keyboard.isDown("left") then 
		if p.inc / 2 < 150 then
			p.x = p.x - (200 + (p.inc / 2)) * dt
		else
			p.x = p.x - 350 * dt
		end
	end
	if love.keyboard.isDown("d") or love.keyboard.isDown("right") then 
		if p.inc / 2 < 150 then
			p.x = p.x + (200 + (p.inc / 2)) * dt
		else
			p.x = p.x + 350 * dt
		end
	end
end
end

--collision detection
	function collide ()
		for i,v in ipairs (g) do 
			if p.vy <= 0 then
				if p.x + p.w > v.x and p.x < v.x + v.w 
					and p.y + p.h >= v.y and p.y + p.h <= v.y + v.h 
					then 
					p.ground = 1
					p.vy = 0
				end
			end
			if p.y + p.h < v.y then
				p.ground = 0
			end
		end
	end


-- adding game over
function check_death ()
	if
--out_of_bounds 
	p.y + p.h / 2 > camera.y + love.graphics.getHeight() or
--water_collide 
	p.y + p.h / 4 > wa.y and p.y + p.h / 4 < wa.y + wa.h then
	dead = "true"
	pause = "true"
	print ("DEAD")
	end
end
--spawning player on the opposite side
function check_side ()
	if p.x + p.w / 2 > love.graphics.getWidth() then
		p.x = p.x - love.graphics.getWidth()
	end
	if p.x + p.w / 2 < 0 then
		p.x = p.x + love.graphics.getWidth()
	end
end

function restart ()
	if love.keyboard.isDown("r") then
		for i = 1, 3, 1 do
			for i,v in ipairs (g) do
				table.remove (g, i)
			end
		end
		p.y = love.graphics.getHeight() - plat:getHeight () - p.h
		camera.y = 0
		wa.y = love.graphics.getHeight() + 1000
		for i,v in ipairs (g) do
			table.remove (g, i)
		end
		ground_fill(0, love.graphics.getHeight() - h, love.graphics.getWidth(), h, 0)
		ground_fill(math.random(0, love.graphics.getWidth() - w), love.graphics.getHeight() - 100, w, h, 0)
		for i = 1, 50, 1 do
		random_map ()
		end
		dead = "false"
		pause = "false"
		r.y = love.graphics.getHeight()
	end
end

--PARENT FUNCTIONS
function PLAYER_UPDATE (dt)
	move (dt)
	collide ()
	check_death ()
	check_side ()
	restart ()
end

function PLAYER_DRAW ()
	love.graphics.setColor(0,0,255)
	love.graphics.rectangle("fill", p.x, p.y, p.w, p.h)
	love.graphics.setColor(255,255,255)
end