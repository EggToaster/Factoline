function loadSys()
    enet = require("enet")
    require("Agame")
    require("loadapi")
    lang.set(conf.lang)
    spdrun=1
    saveselecter=1
    clicktitle=false
    ftd=false
    sca=craftpage*5
    craftpage=0
    hotswap=true
    if device.console then
        hotswap = false
    end
    info = love.filesystem.getInfo("cfg.json")
    if info == nil then
        love.filesystem.newFile("cfg.json")
        love.filesystem.write("cfg.json",'{"mute":false,"fullscreen":false,"lang":"enus","alwmax":false,"vsync":true}')        
    end
    local conwao = love.filesystem.read("cfg.json")
    conf = json.decode((not (conwao == nil)) and conwao or'{"mute":false,"fullscreen":false,"lang":"enus","alwmax":false,"vsync":true}' )
    local dx,dy = love.graphics.getDimensions()
    love.window.setMode(dx,dy,{resizable=(not conf.alwmax)})
    love.window.setFullscreen(conf.fullscreen)
    love.window.setVSync(conf.vsync)
    love.audio.setVolume(conf.mute and 0 or 1)
    if conf.alwmax then
        love.window.maximize()
    end
    gameload()
end
function makegame()
    info = love.filesystem.getInfo("savegame/save"..tostring(saveselecter)..".fsg")
    if info==nil then
    plr.x=math.random(500,mapx-500)
    plr.y=math.random(500,mapy-500)
    plr.handrot=0
    plr.craftopen=false
    plr.rot="right"
    plr.lst = {}
    plr.inventory={{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id="miningpick"},{id="crafttable"},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id="trash"}}
    plr.hotselect=1
    obj.list={}
    title=false
    obj.genworld()
    grabbing=plr.inventory[plr.hotselect+32]
    else
        misc.save.load(love.filesystem.read("savegame/save"..tostring(saveselecter)..".fsg"))
        title=false
    end
end
function love.update(dt)
    gui.action()
    mouse.tick(dt)
    if not device.console then
        if hotswap then
            local scanned = lurker.scan()
        end
    end
    if not title then
        gameupdate(dt)
    end
end
---@diagnostic disable-next-line: duplicate-set-field
function love.keypressed(key)
    if title then
        if key=="escape" then
        love.event.quit()
        else
    end
    else
        if key=="e" then
            if inv.open==1 then
                inv.open=0
                plr.craftopen=false
                plr.craftopeni=0
                crafteruse=false
                for i = 1,#obj.list do
                    if table.haskey(obj.list[i].nbt,"craftopen") then
                        if obj.list[i].nbt.craftopen==true then
                            obj.list[i].nbt.craftopen=false
                        end
                    end
                end
            else
                inv.open=1
            end
        end
        gamekey(key)
    end
    if joymode then
        joymode = false
        print("key")
        mouse.device="mouse"
    end
end
buttonis = function(b,button)
    if b == "a" then
        return(button==1)
    end
    if b == "b" then
        return(button==2)
    end
    if b == "x" then
        return(button==3)
    end
    if b == "y" then
        return(button==4)
    end
    if b == "leftshoulder" then
        return(button==5)
    end
    if b == "rightshoulder" then
        return(button==6)
    end
    if b == "back" then
        return(button==7)
    end
    if b == "start" then
        return(button==8)
    end
    return false
end
function love.joystickpressed(joystick,button)
    joysticks = love.joystick.getJoysticks()[1]
    if not joymode then
        joymode = true
        print("pad")
        mouse.device="stick"
    end
    if title then
        print(button)
        if buttonis("a",button) then
            makegame()
        end
        if buttonis("x",button) then
            love.quit()
        end
    else
        gamepad(button)
    end
end
--if not device.padonly then
function love.mousepressed(x,y,b)
    mouse.mouseevent(x,y,b)
--end
end
function love.wheelmoved(x, y)
    if title then
        if y <= 0 then
            saveselecter =saveselecter-1
        else
            saveselecter=saveselecter+1
        end
        if saveselecter<=0 then
            saveselecter=1
        end
    else
        if crafteruse then
            crafter.wheel(y)
        elseif plr.craftopen then 
            crafttable.wheel(y)
        elseif y < 0 then
            plr.hotselect=plr.hotselect+1
            if plr.hotselect>9 then
                plr.hotselect=1
            end
        elseif y > 0 then
            plr.hotselect= plr.hotselect-1
            if plr.hotselect<1 then
                plr.hotselect=9
            end
        end
    end
end
fntgame = love.graphics.newFont("rmpfont.ttf",30)
love.graphics.setFont(fntgame)
mousedebug=true
socket = require("socket")
---@diagnostic disable-next-line: duplicate-set-field
function love.draw()
    love.graphics.setBackgroundColor(1,1,1)
    if title then
        if stng then
            gui.draw(guiload.get("settingtitle-"..stngtab))
        else
            gui.draw(guiload.get("titlescreen"))
            --love.graphics.print("E OR ESCAPE IN TITLE SCREEN TO EXIT",0,400,0,1,1)
            --love.graphics.print("ESC AND L TO EXIT TO TITLE SCREEN",0,450,0,1,1)
            --love.graphics.print("PRESS ANY KEY TO START P TO TOGGLE FULLSCREEN",0,500,0,1,1)
            --love.graphics.print("RESTART TO APPLY CONFIG I TO INVENTORY",0,550,0,1,1)
            --love.graphics.print("WASD TO MOVE SPACE TO INTERACT/MINE",0,600,0,1,1)
            --love.graphics.print("N TO DISMANTILE TOUCHING BUILDING",0,650,0,1,1)
        end
    else
        gui.tempguinow = nil
        gamedraw()
    end
    if mousedebug and (not device.console) then
        love.graphics.setColor(0,1,0)
        love.graphics.print((love.mouse.getX().." "..love.mouse.getY()),0,0,0,1,1)
        love.graphics.setColor(1,1,1)
    end
    mouse.draw()
end