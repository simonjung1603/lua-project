--require "resources/Map"
require "resources/player"
require "resources/platforms"
require "resources/camera"
require "resources/extras"
w = 150
h = 20

function love.load()
	--load
	ground_fill(0, love.graphics.getHeight() - h, love.graphics.getWidth(), h)
	ground_fill(500, 500, w, h)
	ground_fill(300, 420, w, h, "spring")
	ground_fill(100, 340, w, h)
	ground_fill(300, 260, w, h)
	ground_fill(500, 180, w, h, "spring")
	ground_fill(300, 100, w, h)
end

function love.update(dt)
	--update
	PLAYER_UPDATE (dt)
	camera:move ()
end

function love.draw()
	--draw
	camera:set ()
	PLAYER_DRAW ()
	ground_draw()
	love.graphics.print("ground:"..p.ground,300,500)
	camera:unset ()
end
