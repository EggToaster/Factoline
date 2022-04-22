require("api.graphics")
function loadgraphics()
    love.graphics.clear()
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill",0,0,10000,10000)
    love.graphics.setColor(0,0,0)
    gr.draw.txt("LOADING GAME",100,100,1,1)
    gr.draw.txt(loadphase,100,200,1,1)
    gr.draw.txt(loadphase2,100,300,1,1)
    love.graphics.present()
end
function loadergame()
    love.window.setIcon(love.image.newImageData("res/500icon.png"))
    loadphase="requiring code..."
    loadphase2="player"
    loadgraphics()
    require("api.player")
    loadphase2="lang"
    loadgraphics()
    require("api.langsys")
    loadphase2="item"
    loadgraphics()
    require("api.item")
    loadphase2="item"
    loadgraphics()
    require("api.inventory")
    loadphase2="inventory"
    loadgraphics()
    require("api.obj")
    loadphase2="obj"
    loadgraphics()
    require("api.sfx")
    love.audio.setVolume(0.25)
    loadphase2="sfx"
    loadgraphics()
    camera = require("api.camera")
    cam = camera()
    loadphase="Loading Texture Index"
    loadphase2="undefined"
    loadgraphics()
    gr.texture.load()
    loadphase="Parsing Texture Inside Table"
    loadphase2="initialising"
    loadgraphics()
    gr.texture.parse()
    loadphase="Parsing Sound Inside Table"
    loadphase2="initialising"
    sfx.loadsound()
    loadphase2="undefined"
    loadphase="DONE!"
    loadgraphics()
    wait(0.3)
    love.graphics.setColor(0,0,0)
    loading=0
end