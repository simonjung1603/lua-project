-- Spring extra
s = {}
s.x = 0
s.y = 0
s.w = 0
s.h = 0
visibility = false
--adding a spring to the game
function setSpring (x, y, w, h)
	love.graphics.setColor(255,0,0)
	s.x = x
	s.y = y
	s.w = w
	s.h = h
	for i,v in ipairs (g) do
		love.graphics.rectangle("fill", s.x, s.y, s.w, s.h)
	end
	love.graphics.setColor(255,255,255)
	if p.y + p.h < s.y + s.h and p.y + p.h > s.y 
		and p.x + p.w / 2 > s.x and p.x + p.w / 2 < s.x + s.w
		then
		p.vy = 500 + p.inc*3.5
		
	end
end
-- End of spring 

-- Chasing water
wa = {x = 0, y = love.graphics.getHeight() + 1000, w = love.graphics.getWidth(), h = 20,v = 50}

function water_move (dt)
-- water_jump
	if pause == "false" then 
		if p.y - wa.y < - 200 
			then wa.v = 200 + p.inc
			else
				wa.v = 75
		end
	end
-- water_rise 
	wa.y = wa.y - wa.v * dt
end

function water_draw ()
	love.graphics.setColor(0,255,0)
	love.graphics.rectangle("fill", wa.x, wa.y, wa.w, wa.h)
	love.graphics.setColor(255,255,255)
end
-- End Of Chasing Water

-- Pause Button
pause = "false"
dead = "false"
function pause_game ()
	function love.keypressed(key) 
		if key == "p" then
			if dead == "false" then
				if pause == "false"  
					then pause = "true"
				else 
					pause = "false"
				end
			end
		end
	end
	if pause == "true" then
		wa.v = 0
		--add enemy freeze
		--add time freeze
	end
end
-- End Of Pause Button

-- ruler
r = {y = love.graphics.getHeight()}
function ruler ()
	if p.y < r.y then
		r.y = p.y
	else
		r.y = r.y
	end
	number = math.floor((r.y * -1) + love.graphics.getHeight() - plat:getHeight () - p.h + 0.5)
	love.graphics.print("ruler:"..math.floor(number / 10 + 0.5),300,camera.y)
end
-- end of ruler


--PARENT FUNCTIONS
function EXTRAS_UPDATE (dt)
	pause_game ()
	water_move (dt)


end

function EXTRAS_DRAW ()
	water_draw ()
	ruler ()
end
