function map()
section1{["x"] = 1, ["x"] = 1 , ["heigth"] = 0, ["width"] = 0 , {["ison"] = false}
section2{["x"] = 1, ["x"] = 1 , ["heigth"] = 0, ["width"] = 0 , {["ison"] = false}
section3{["x"] = 1, ["x"] = 1 , ["heigth"] = 0, ["width"] = 0 , {["ison"] = false}
section4{["x"] = 1, ["x"] = 1 , ["heigth"] = 0, ["width"] = 0 , {["ison"] = false}
section5{["x"] = 1, ["x"] = 1 , ["heigth"] = 0, ["width"] = 0 , {["ison"] = false}
section6{["x"] = 1, ["x"] = 1 , ["heigth"] = 0, ["width"] = 0 , {["ison"] = false}
goto redraw
if section.ison == false then
section1.x = math.random(0, 600)
section1.y = math.random(0, 100)
while section1.x < section2.x + 50 or section1.x > section2.x - 100 do
section1.x = math.random(0, 600)
end
while section1.y < section2.y + 50 or section1.y > section2.y - 100 do
section1.y = math.random(0, 600)
end
end
end
