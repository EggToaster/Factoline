function love.load()
    require("api.spec.device")
    require("api.spec.mouse")
    require("api.mathutil")
    device = require("api.spec.devicepreset").pc
    appId = "940840855957291018"
    dload.load()
    if not device.console then
        discordRPC = require("api.3rd.discordRPC")
        require("api.un3rddrpc")
        dsc.load()
        lume = require("api.3rd.lume")
        lurker = require("api.3rd.lurker")
        require("api.3rd.donut")
        donut = Donut.init(10, 10)
        fps = donut.add("FPS")
        xdebug=donut.add("X")
        ydebug=donut.add("Y")
    end
    joymode = device.padonly
    for i = 1,5 do
        math.randomseed(os.time());math.random();math.random();math.random()
    end
    mapx=50000
    mapy=mapx
    loading=true
    title=true
    fulltogg=true
    titleimg = love.graphics.newImage("res/factoryicn.png")
    love.window.setIcon(love.image.newImageData("res/factoryicn.bmp"))
    crtkeypress=true
    require("loadapi")
    loadergame()
    require("Asys")
    loadSys()
end
function love.quit()
    if not device.console then
        discordRPC.shutdown()
    end
end