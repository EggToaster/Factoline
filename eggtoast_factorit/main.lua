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
    love.window.setIcon(love.image.newImageData("res/factoryicn.bmp"))
    crtkeypress=true
    require("loadapi")
    require("Asys")
    loadergame()
    loadSys()

    function getdx()
        local dx,dy = love.graphics.getDimensions()
        return dx
    end
    function getdy()
        local dx,dy = love.graphics.getDimensions()
        return dy
    end
    function getdx(offset)
        local dx,dy = love.graphics.getDimensions()
        return dx+offset
    end
    function getdy(offset)
        local dx,dy = love.graphics.getDimensions()
        return dy+offset
    end
    --Return first args,really trash
    function dummy(arg)
        return arg
    end
end

function love.quit()

end