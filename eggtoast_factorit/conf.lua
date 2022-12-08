json = require("api.3rd.json")
device = require("api.spec.devicepreset").switch
require("api.mathutil")
function love.conf(t)
    require("moduleoption").main(t)
t.console = {"192.168.1.3", 8000,true}
    t.identity = "eggtoast_factorit"
    t.window.title = "Factorit!"
    t.version = "11.3"
    t.window.width = 1024
    t.window.height = 768
    t.window.resizable = true
    t.gammacorrect = false
    t.externalstorage = false
    t.accelerometerjoystick = false

    t.audio.mic = false
    t.audio.mixwithsystem = false
    t.window.vsync = 0

    --info = love.filesystem.getInfo("config/fullscreen.txt")
    --if info == nil then
    --    love.filesystem.newFile("config/fullscreen.txt")
    --    love.filesystem.write("config/fullscreen.txt","false")        
    --end
    info = love.filesystem.getInfo("cfg.json")
    if info == nil then
        love.filesystem.newFile("cfg.json")
        love.filesystem.write("cfg.json",'{"mute":false,"fullscreen":false,"lang":"enus"}')        
    end
    info = love.filesystem.getInfo("savegame")
    if info == nil then
        love.filesystem.createDirectory("savegame")     
    end
    conf = json.decode(love.filesystem.read("cfg.json"))
    if table.contains(conf,lang) then
    else
        love.filesystem.write("cfg.json",'{"mute":false,"fullscreen":false,"lang":"enus"}')  
    end
        t.window.fullscreen = conf.fullscreen
end
function love.lowmemory()
    print("Running Out Of memory.(ALMOST CRASH!)")
end