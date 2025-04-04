function love.load()
    --[[TODO LISTS -- This is likely not up to date. 
        Asys.lua   -- Just search for "TODO:".
        conf.lua
        main.lua(here) 
        langsys.lua
        inventory.lua
        ja-jp.lua
        building.lua
        input.lua
    ]]
    
    log = require("code.logger")
    json = require("code.3rd.json")
    jsondebug = require("code.3rd.jsondebug")
    lume = require("code.3rd.lume")
    util = require("code.util")
    require("code.input")
    require("code.loader.texload")
    require("code.loader.guiloader")
    require("code.loader.sfx")
    require("code.misc")
    require("code.player")
    require("code.langsys")
    require("code.item")
    require("code.inventory")
    require("code.obj")
    require("code.gui")

    log:init(true,true,true,table.contains(arg,"-d"),table.contains(arg, "-v"))

    if table.contains(arg, "-h") then
        lurker = require("code.3rd.lurker")
    end

    guiload.loadgui()
    texture.loadtex()
    sfx.loadsound()

    camera = require("code.3rd.camera")
    cam = camera()
    mnm = camera()

    love.audio.setVolume(0.25) --TODO: FIXME: 100% should not be loud

    if love.filesystem.getInfo("cfg.json") == nil then
        love.filesystem.write("cfg.json",json.encode({}))
    end
    conf = json.decode(love.filesystem.read("cfg.json") or "{}")
    if not table.haskey(conf,"vsync") then
        conf.vsync = true
    end
    if not table.haskey(conf,"lang") then
        conf.lang = "enus"
    end
    if not table.haskey(conf,"alwmax") then
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

    love.window.setIcon(love.image.newImageData("res/tex/factoryicn.bmp"))

    math.randomseed(os.time())
    for i = 1,5 do
        math.random()
    end

    local fntgame = love.graphics.newFont("rmpfont.ttf",60)
    love.graphics.setFont(fntgame)

    title=true
    require("Asys")
    loadSys()
end

function love.quit()

end
