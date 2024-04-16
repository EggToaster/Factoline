function love.load()
    json = require("code.3rd.json")
    require("code.util")
    require("code.spec.device")
    require("code.spec.mouse")

    mapx=50000
    mapy=mapx

    conf = json.decode(love.filesystem.read("cfg.json") or {})
    if not table.haskey(conf,"vsync") then
        conf.vsync = true
    end
    if not table.haskey(conf,"lang") then
        conf.lang = "enus"
    end
    if not table.haskey(conf,"alwmax") then --TODO: remove always max feature
        conf.alwmax=false
    end
    if not table.haskey(conf,"mute") then --TODO: change this to volume
        conf.mute=false
    end
    if not table.haskey(conf,"fullscreen") then
        conf.fullscreen=false
    end
    love.filesystem.write("cfg.json",json.encode(conf))
    local info = love.filesystem.getInfo("savegame")
    if info == nil then
        love.filesystem.createDirectory("savegame")     
    end

    local device = require("code.spec.devicepreset")["pc"]
    dload.load()

    math.randomseed(os.time())
    for i = 1,5 do
        math.random()
    end

    loading=true
    title=true
    love.window.setIcon(love.image.newImageData("res/tex/factoryicn.bmp"))
    crtkeypress=true
    require("loadapi")
    require("Asys")
    loadergame()
    loadSys()

    function getdx()
        local dx,dy = love.graphics.getDimensions()
        return dx
    end
    function getdy()
        local dx,dy = love.graphics.getDimensions()
        return dy
    end
    function getdx(offset)
        local dx,dy = love.graphics.getDimensions()
        return dx+offset
    end
    function getdy(offset)
        local dx,dy = love.graphics.getDimensions()
        return dy+offset
    end
    --Return first args,really trash
    function dummy(arg)
        return arg
    end
end

function love.quit()

end
