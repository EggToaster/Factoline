function loadergame()
    --loaders
    require("api.loader.texload")
    require("api.loader.guiloader")
    require("api.loader.sfx")

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
    guiload.loadgui()
    love.audio.setVolume(0.25)
    texture.loadtex()
    cam = camera()
    mnm = camera()
    sfx.loadsound()
    --anim = require("api.3rd.anim")
    loading=false
end