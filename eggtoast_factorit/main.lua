function love.load()
    --[[TODO LISTS
        Asys.lua
        conf.lua
        main.lua(here)
        langsys.lua
        inventory.lua
        ja-jp.lua
        building.lua
        input.lua
    ]]
    json = require("code.3rd.json")
    require("code.util")
    require("code.spec.mouse")
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
    require("code.logger")

    log.init(true,true,true,true,table.contains(arg, "-v"))
    hotswap = table.contains(arg, "-d")

    if hotswap then
        lume = require("code.3rd.lume")
        lurker = require("code.3rd.lurker")
    end

    guiload.loadgui()
    texture.loadtex()
    sfx.loadsound()

    camera = require("code.3rd.camera")
    cam = camera()
    mnm = camera()

    love.audio.setVolume(0.25)

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
