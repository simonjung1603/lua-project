function love.conf(t)
	t.window.title = "Frozen Element Studios - 1"
    t.window.width = 1366
    t.window.height = 600
    t.console = true
end

function change_background ()
	if love.keyboard.isDown("c") then
		love.graphics.setBackgroundColor(math.random(0, 255), math.random(0, 255), math.random(0, 255))
	end
end
