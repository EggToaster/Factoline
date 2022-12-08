noise = {}
local hei = 500
local wid = 500
function generateNoiseGrid()
	-- Fill each tile in our grid with noise.
	local baseX = 10000 * love.math.random()
	local baseY = 10000 * love.math.random()
	for y = 1, hei do
		noise[y] = {}
		for x = 1, wid do
			noise[y][x] = love.math.noise(baseX+.1*x, baseY+.2*y)
		end
	end
	noisecomp = noise
	noise=nil
	noise = noisecomp
	if love.filesystem.getInfo("savegame/save1.noise")==nil then
		love.filesystem.newFile("savegame/save1.noise")
	end
	love.filesystem.write("savegame/save1.noise",json.encode(noisecomp))
end

function drawNoise()
    local tileSize = 2
	for y = 1, #noise do
		for x = 1, #noise[y] do
			love.graphics.setColor(1, 1, 1, noise[y][x])
			love.graphics.rectangle("fill", x*tileSize, y*tileSize, tileSize-1, tileSize-1)
		end
	end
	love.graphics.setColor(1,1,1,255)
end