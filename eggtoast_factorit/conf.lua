function love.conf(t)
    gamever = 0.1
    
    mapx=50000
    mapy=mapx

    t.identity = "eggtoast_factorit" --TODO: change this line in beta 1 release
    t.window.title = "Factoline"
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
