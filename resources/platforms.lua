-- define platforms
--g is the table that stores all the variables for the ground
g = {}

plat = love.graphics.newImage("resources/platform.png")
function ground_fill (x, y, w, h, ex, coin)
	table.insert (g, {x = x, y = y, w = w, h = h, ex = ex, coin = coin})
end

function ground_draw ()
	for i,v in ipairs (g) do
		--love.graphics.setColor(math.random (0, 255), math.random (0, 255), math.random (0, 255))
		love.graphics.draw(plat, v.x, v.y)
		love.graphics.setColor(255,255,255)
		if v.ex < 25 and v.ex > 0 then
			setSpring (v.x + 25, v.y - 10, v.w - 50, v.h - 10)
		end
		if v.coin == true then
			setCoin ((v.x + v.w / 2) - coin.h / 2, v.y - coin.h * 2)
		end
		--coin (5, 5)
	end
end
function remove_platform ()
	for i,v in ipairs (g) do
		if v.y > camera.y + love.graphics.getHeight() + 80 then
			v.coin = false
			table.remove (g, i)	
			if math.random (1,2) == 1 then
				random_map ()
			end
		end
	end
end