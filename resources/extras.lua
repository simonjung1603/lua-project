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
		p.vy = 500
	end
end
-- End of spring 

