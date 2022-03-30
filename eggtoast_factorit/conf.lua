json = require("api.json")
function love.conf(t)
    t.identity = "eggtoast_factorit"
    t.window.title = "Factorit!"
    t.window.icon = "res/factoryicn.bmp"
    t.window.width = 1024
    t.window.height = 768
    t.version = "11.3"
    t.window.resizable = true
    t.window.minwidth = 1024
    t.window.minheight = 768
    --info = love.filesystem.getInfo("config/fullscreen.txt")
    --if info == nil then
    --    love.filesystem.newFile("config/fullscreen.txt")
    --    love.filesystem.write("config/fullscreen.txt","false")        
    --end
    info = love.filesystem.getInfo("cfg.json")
    if info == nil then
        love.filesystem.newFile("cfg.json")
        love.filesystem.write("cfg.json",'{"mute":false,"fullscreen":false}')        
    end
    conf = json.decode(love.filesystem.read("cfg.json"))

    if conf.fullscreen=="true" then
        t.window.fullscreen = true
    else
        t.window.fullscreen = false
    end
end
function love.lowmemory()
    print("Running Out Of memory.(ALMOST CRASH!)")
end