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
wa = {x = 0, y = love.graphics.getHeight() + 1000, w = love.graphics.getWidth(), h = 20,v = 50, water = love.graphics.newImage("resources/water.png")}

function water_move (dt)
-- water_jump
	if p.y < 0 then
		if pause == "false" then 
			if p.y - wa.y < - 220 
				then wa.v = 200 - (p.y - wa.y)
				else
					wa.v = 75 
			end
		end
	-- water_rise 
		wa.y = wa.y - wa.v * dt
	end
end

function water_draw ()
	love.graphics.draw(wa.water, wa.x, wa.y)
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

--fly
	function fly ()
		if love.keyboard.isDown("f") then
			gravity = 0
			p.vy = 2000
		end
	end
--end

--coin
money = 0
coin = {x = 0, y = 0, w = 0, h = 0, collected = "false", coin = love.graphics.newImage("resources/coin.png")}
coin.w = coin.coin:getWidth ()
coin.h = coin.coin:getHeight ()
function setCoin (x, y)
	coin.x = x
	coin.y = y
	for i,v in ipairs (g) do
		if v.coin == true then
			love.graphics.draw(coin.coin, coin.x, coin.y)
		end
	end
		for i,v in ipairs (g) do
			if coin.y < p.y + p.h and coin.y + coin.h > p.y 
				and p.x + p.w > coin.x and p.x < coin.x + coin.w
			then 
				if v.y > p.y and v.y - coin.h * 2 < p.y + p.h and v.x - p.x < 0 and (v.x + v.w) - p.x > 0 then
					v.coin = false
					money = money + 1
				end
			end
		end
		love.graphics.print("coins:"..money, 300, camera.y + 10)
end

--PARENT FUNCTIONS
function EXTRAS_UPDATE (dt)
	pause_game ()
	water_move (dt)
	fly ()
	


end

function EXTRAS_DRAW ()
	water_draw ()
	ruler ()
end
