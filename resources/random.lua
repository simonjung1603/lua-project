n = {x, y, w, h, ex} -- new platform
m = {x, y, w, h, ex} -- mirror platform
function add_platform ()
	for i,v in ipairs (g) do
		n.y = v.y - 80
		n.w = v.w
		n.h = v.h
		n.x = math.random (0, love.graphics.getWidth() - n.w)
		n.ex = math.random (0, 500)
		if math.random (1,2) == 1 then
			n.coin = true
			m.coin = false
		else
			n.coin = false
			m.coin = true
		end
		--print (i)

		m.x = math.random (0, love.graphics.getWidth() - n.w)
		if m.x > 0 and m.x + n.w < love.graphics.getWidth() then
			while m.x < n.x + n.w and m.x + n.w > n.x do
				m.x = m.x + n.w + 100
			end 
		else
			m.x = math.random (0, love.graphics.getWidth() - n.w)
		end
		m.y = n.y
	
		if n.ex <= 25 and n.ex > 0 then -- if it's a spring make it something different
			m.ex = math.random (0, math.random (26, 500))
		--elseif  --add different powerups 
		else
			m.ex = math.random(0, 500)
		end 

	end
end

function random_map ()
--	for i = 1, 100, 1 do
	add_platform ()
	ground_fill (n.x, n.y, n.w, n.h, n.ex, n.coin)
	ground_fill (m.x, m.y, n.w, n.h, m.ex, m.coin)
--end
end