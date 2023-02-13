function love.conf(t)
    json = require("api.3rd.json")
    require("api.mathutil")
    t.identity = "eggtoast_factorit"
    t.window.title = "Factorit!"
    t.version = "11.3"
    t.window.width = 1024
    t.window.height = 768
    t.window.resizable = true
    t.gammacorrect = false
    t.externalstorage = false
    t.accelerometerjoystick = false

    t.audio.mic = false
    t.audio.mixwithsystem = false

    info = love.filesystem.getInfo("cfg.json")
    if info == nil then
        love.filesystem.newFile("cfg.json")
        love.filesystem.write("cfg.json",'{"mute":false,"fullscreen":false,"lang":"enus","alwmax":false,"vsync":true}')        
    end
    info = love.filesystem.getInfo("savegame")
    if info == nil then
        love.filesystem.createDirectory("savegame")     
    end
    conf = json.decode(love.filesystem.read("cfg.json"))
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
        t.window.fullscreen = conf.fullscreen
        t.window.vsync = (conf.vsync and 1 or 0)
        t.window.resizable=not conf.locksize
end