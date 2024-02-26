function loadergame()
    --loaders
    require("code.loader.texload")
    require("code.loader.guiloader")
    require("code.loader.sfx")
    guiload.loadgui()
    texture.loadtex()
    sfx.loadsound()

    --general
    if not device.console then
        lume = require("code.3rd.lume")
        lurker = require("code.3rd.lurker")
    end

    require("code.misc")
    require("code.player")
    require("code.langsys")
    require("code.item")
    require("code.inventory")
    require("code.obj")
    require("code.gui")

    camera = require("code.3rd.camera")
    cam = camera()
    mnm = camera()
    
    love.audio.setVolume(0.25)

    loading=false
end