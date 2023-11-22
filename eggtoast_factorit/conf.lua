function love.conf(t)
    json = require("api.3rd.json")
    require("api.mathutil")
    t.identity = "eggtoast_factorit"
    t.window.title = "Factorit!"
    t.version = "11.3"
    t.window.width = 1024
    t.window.height = 768
    t.window.resizable = true
    t.gammacorrect = false
    t.externalstorage = false
    t.accelerometerjoystick = false
    t.window.fullscreen = false
    t.window.vsync = 1
    t.window.resizable = true
end