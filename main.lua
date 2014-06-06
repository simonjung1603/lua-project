--require "resources/Map"
require "resources/player"
require "resources/platforms"
require "resources/camera"
require "resources/extras"
require "resources/random"

w = 150
h = 20
ran = 0

function love.load()
	--load
	math.randomseed (os.time())
	love.graphics.setBackgroundColor(math.random(0, 255), math.random(0, 255), math.random(0, 255))
	ground_fill(0, love.graphics.getHeight() - h, love.graphics.getWidth(), h, 0)
	ground_fill(math.random(0, love.graphics.getWidth() - w), love.graphics.getHeight() - 100, w, h, 0)
	for i = 1, 20, 1 do
		random_map ()
	end
	--ground_fill(300, 420, w, h, "spring")
	--ground_fill(100, 340, w, h)
	--ground_fill(300, 260, w, h)
	--ground_fill(500, 180, w, h, "spring")
	--ground_fill(300, 100, w, h)
end

function love.update(dt)
	--update
	math.randomseed (os.time())
	PLAYER_UPDATE (dt)
	EXTRAS_UPDATE (dt)
	remove_platform ()
	camera:move ()
end

function love.draw()
	--draw
	camera:set ()
	PLAYER_DRAW ()
	EXTRAS_DRAW ()
	ground_draw()
	--love.graphics.print("ground:"..ran,300,camera.y)
	camera:unset ()
end
