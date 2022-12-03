json = require("api.3rd.json")
device = require("api.spec.devicepreset").switch
require("api.mathutil")
function love.conf(t)
t.console = {"192.168.1.3", 8000,true}
    t.identity = "eggtoast_factorit"
    t.window.title = "Factorit!"
    t.version = "11.3"
    --info = love.filesystem.getInfo("config/fullscreen.txt")
    --if info == nil then
    --    love.filesystem.newFile("config/fullscreen.txt")
    --    love.filesystem.write("config/fullscreen.txt","false")        
    --end
    info = love.filesystem.getInfo("cfg.json")
    if info == nil then
        love.filesystem.newFile("cfg.json")
        if device.device=="NS" then
        end
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

        t.window.fullscreen = true
end
function love.lowmemory()
    print("Running Out Of memory.(ALMOST CRASH!)")
end