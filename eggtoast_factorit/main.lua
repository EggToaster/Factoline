function love.load()
    ver = 0.1
    conf = json.decode(love.filesystem.read("cfg.json") or'{"mute":false,"fullscreen":false,"lang":"enus","alwmax":false,"vsync":true}' )
    if not table.haskey(conf,"vsync") then
        conf.vsync = true
    end
    if not table.haskey(conf,"lang") then
        conf.lang = "enus"
    end
    if not table.haskey(conf,"alwmax") then
        conf.alwmax=false
    end
    if not table.haskey(conf,"mute") then
        conf.mute=false
    end
    if not table.haskey(conf,"fullscreen") then
        conf.fullscreen=false
    end
    love.filesystem.write("cfg.json",json.encode(conf))  
    info = love.filesystem.getInfo("savegame")
    if info == nil then
        love.filesystem.createDirectory("savegame")     
    end
    require("code.spec.device")
    require("code.spec.mouse")
    require("code.mathutil")
    ---@diagnostic disable-next-line: undefined-field
    device = require("code.spec.devicepreset")["pc"]
    dload.load()
    for i = 1,5 do
        math.randomseed(os.time());math.random();math.random();math.random()
    end
    mapx=50000
    mapy=mapx
    loading=true
    title=true
    fulltogg=true
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
