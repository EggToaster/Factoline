function loadergame()
    --loaders
    require("api.loader.texload")
    require("api.loader.guiloader")
    require("api.loader.sfx")
    guiload.loadgui()
    texture.loadtex()
    sfx.loadsound()

    --general
    if not device.console then
        lume = require("api.3rd.lume")
        lurker = require("api.3rd.lurker")
    end

    require("api.misc")
    require("api.player")
    require("api.langsys")
    require("api.item")
    require("api.inventory")
    require("api.obj")
    require("api.gui")

    camera = require("api.3rd.camera")
    cam = camera()
    mnm = camera()
    
    love.audio.setVolume(0.25)

    loading=false
end