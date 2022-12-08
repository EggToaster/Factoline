function loadergame()
    --deprecated soon more info:api/dprc/readme.txt
    require("api.dprc.graphics")
    require("api.dprc.savesys")
    love.graphics.clear()
    love.graphics.setColor(0,0,0)
    love.graphics.print("LOADING GAME",100,100,1,1)
    love.graphics.present()
    --loaders
    require("api.loader.texload")
    require("api.loader.guiloader")
    require("api.loader.sfx")
    --general
    require("api.player")
    require("api.langsys")
    require("api.item")
    require("api.inventory")
    require("api.obj")
    require("api.gui")
    camera = require("api.3rd.camera")
    --activate loader
    guiload.loadgui()
    love.audio.setVolume(0.25)
    gr.texture.load()
    gr.texture.parse()
    --game camera
    cam = camera()
    --minimap
    mnm = camera()
    sfx.loadsound()
    loading=false
    anim = require("api.3rd.anim")
end