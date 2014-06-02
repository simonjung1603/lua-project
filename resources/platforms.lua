-- define platforms
--g is the table that stores all the variables for the ground
g = {}


function ground_fill (x, y, w, h)
	table.insert (g, {x = x, y = y, w = w, h = h})
end

function ground_draw ()
	for i,v in ipairs (g) do
		love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
	end
end