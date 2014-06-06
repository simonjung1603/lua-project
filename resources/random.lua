n = {x, y, w, h}
function add_platform ()
		for i,v in ipairs (g) do
			n.y = v.y - 80
			n.w = v.w
			n.h = v.h
			n.x = math.random (0, love.graphics.getWidth() - n.w)
	end
end

function random_map ()
	for i = 1, 1000, 1 do
	add_platform ()
	ground_fill (n.x, n.y, n.w, n.h)
	ground_fill (math.random (0, love.graphics.getWidth() - n.w), n.y, n.w, n.h)
end
end