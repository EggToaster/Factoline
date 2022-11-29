json = require("api.3rd.json")
function table.contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end
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

    if conf.fullscreen=="true" then
        t.window.fullscreen = true
    else
        t.window.fullscreen = false
    end
end
function love.lowmemory()
    print("Running Out Of memory.(ALMOST CRASH!)")
end