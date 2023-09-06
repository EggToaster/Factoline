function love.load()
    require("api.spec.device")
    require("api.spec.mouse")
    require("api.mathutil")
    ---@diagnostic disable-next-line: undefined-field
    local dev = love._console_name
    if dev == "3DS" then
        dev = "threeds"
    elseif dev == "Switch" then
        dev = "switch"
    elseif dev == nil then
        dev = "pc"
    end
    device = require("api.spec.devicepreset")[dev]
    dload.load()
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
    require("Asys")
    loadergame()
    loadSys()
end
function love.quit()

end