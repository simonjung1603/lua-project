-- define platforms
--g is the table that stores all the variables for the ground
g = {}


function ground_fill (x, y, w, h, ex)
	table.insert (g, {x = x, y = y, w = w, h = h, ex = ex})
end

function ground_draw ()
	for i,v in ipairs (g) do
		love.graphics.setColor(math.random (0, 255), math.random (0, 255), math.random (0, 255))
		love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
		love.graphics.setColor(255,255,255)
		if v.ex == "spring" then
			setSpring (v.x + 25, v.y - 10, v.w - 50, v.h - 10)
		end
	end
end