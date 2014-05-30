function love.load()
section1{1="x", 1 = "y", 1="h", 1 = "w", true = "on"}
section2{1="x", 1 = "y", 1="h", 1 = "w", true = "on"}
section3{1="x", 1 = "y", 1="h", 1 = "w", true = "on"}
section4{1="x", 1 = "y", 1="h", 1 = "w", true = "on"}
section5{1="x", 1 = "y", 1="h", 1 = "w", true = "on"}
section6{1="x", 1 = "y", 1="h", 1 = "w", true = "on"}
end
function love.update()
goto redraw
if section.on == false then
section1.x = math.random(0, 600)
section1.y = math.random(0, 100)
if section1.x < section2.x + 50 then
::redraw::
end
if section1.y < secttion2.y + 50 then
::redraw::
end
end
end
