function loadSys()
    spdrun=1
    require("Agame")
    require("loadapi")
    saveselecter=1
    clicktitle=false
    ftd=false
    sca=craftpage*5
    craftpage=0
    hotswap=false
    require("noise")
    generateNoiseGrid()
end
if device.console then
    if hotswap then
        hotswap = false
        print("[Device]This is console, no hotswap!!")
    end
end
function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end
function keyOf(tbl, value)
    for k, v in pairs(tbl) do
        if v == value then
            return k
        end
    end
    return nil
end
function love.update(dt)
    gui.action()
    mouse.tick(dt)
    if hotswap then
    --local scanned = lurker.scan()
    end
    if not device.console then

    if nextPresenceUpdate < love.timer.getTime() then
        if title then
        discordRPC.updatePresence(presencetitle)
        else
        discordRPC.updatePresence(presencegame)
        end
        nextPresenceUpdate = love.timer.getTime() + 2.0
    end
    discordRPC.runCallbacks()
    end
    if title and stng then
       --[[ 
        --love.graphics.rectangle("fill",0,0,250,150)
        --love.graphics.print("BACK",25,25,0,2.5,2.5)
        mousecoordx,mousecoordy = love.mouse.getPosition()
        if love.mouse.isDown(1) and clicktitle==false and mousecoordx>0 and mousecoordy>0 and mousecoordx<250 and mousecoordy<150 then
            stng=false
        end
        --love.graphics.rectangle("fill",250,500,500,150)
        --love.graphics.print(lang.gettxt("title.lang"),275,525,0,2.5,2.5)
        if love.mouse.isDown(1) and clicktitle==false and mousecoordx>250 and mousecoordy>500 and mousecoordx<750 and mousecoordy<650 then
            local temppp = indexOf(lang.langcycle,lang.currentlang)
            if temppp > #lang.langcycle then
                temppp=1
            end
            if lang.langcycle[temppp] == "enus" then
                jajplang.setlang()
                lang.currentlang="jajp"
            else
                enuslang.setlang()
                lang.currentlang="enus"
            end
            print("lang set to "..lang.currentlang)
            conf.lang=lang.currentlang
            love.filesystem.write("cfg.json",json.encode(conf))

        end
        --love.graphics.rectangle("fill",250,350,500,150)
        --love.graphics.print(lang.gettxt("title.fullscreen"),275,350,0,2.5,2.5)
        if love.mouse.isDown(1) and clicktitle==false and mousecoordx>250 and mousecoordy>350 and mousecoordx<750 and mousecoordy<500 then
            if ftd then else
                readres = conf.fullscreen
                if readres=="true" then
                    towrite="false"
                else
                    towrite="true"
                end
                conf.fullscreen=towrite
                love.filesystem.write("cfg.json",json.encode(conf))
            --debug    if ftd then
            --    ftd=false
            --    else
            --    ftd =true
            --    end
            end
        end]]
        else
        if title then
        mousecoordx,mousecoordy = mouse.getPos()
        if mouse.ison(1) and clicktitle==false and mousecoordx>250 and mousecoordy>350 and mousecoordx<750 and mousecoordy<500 then
            makegame()
        end
        if mouse.ison(1) and clicktitle==false and mousecoordx>250 and mousecoordy>525 and mousecoordx<750 and mousecoordy<700 then
            stng=true
        end
    end
end
function makegame()
    info = love.filesystem.getInfo("savegame/save"..tostring(saveselecter)..".fsg")
    if info==nil then
    plr.x=math.random(500,mapx-500)
    plr.y=math.random(500,mapy-500)
    plr.handrot=0
    plr.craftopen=false
    plr.rot="right"
    plr.inventory={{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id="miningpick"},{id="crafttable"},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id="trash"}}
    plr.hotselect=1
    obj.list={}
    title=false
    obj.genworld()
    grabbing=plr.inventory[plr.hotselect+32]
    else
        savesys.load(json.decode(love.filesystem.read("savegame/save"..tostring(saveselecter)..".fsg")))
        --mulplay.join("localhost:6789")
        title=false
    end
end
if title then
    if mouse.ison(1) then
        clicktitle=true
    else
        clicktitle=false
    end
else
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
function love.joystickpressed(joystick,button)
    joysticks = love.joystick.getJoysticks()[1]
    if not joymode then
        joymode = true
        print("pad")
        mouse.device="stick"
    end
    if title then
        if button=="a" then
            makegame()
        end
        if "x"==button then
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
        else
        if plr.craftopen then 
            craftbench.wheel(y)
        else
    if y < 0 then
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
end
end
fntgame = love.graphics.newFont("rmpfont.ttf",30)
love.graphics.setFont(fntgame)
mousedebug=true
socket = require("socket")
---@diagnostic disable-next-line: duplicate-set-field
function love.draw()
    if title then
        if stng then
            gui.draw(guiload.get("settingtitle-general"))
        else
    love.graphics.setBackgroundColor(1,1,1)
    love.graphics.draw(titleimg,0,0)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line",250,350,500,150)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill",250,350,500,150)
    love.graphics.setColor(0,0,0)
    love.graphics.print(lang.gettxt("title.playbutton"),275,375,0,2.5,2.5)
    love.graphics.print(lang.gettxt("title.saveselect1")..tostring(saveselecter)..lang.gettxt("title.saveselect2"),0,0,0,0.5,0.5)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line",250,525,500,150)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill",250,525,500,150)
    love.graphics.setColor(0,0,0)
    love.graphics.print(lang.gettxt("title.settingsbutton"),275,550,0,2.5,2.5)
    --love.graphics.print("E OR ESCAPE IN TITLE SCREEN TO EXIT",0,400,0,1,1)
    --love.graphics.print("ESC AND L TO EXIT TO TITLE SCREEN",0,450,0,1,1)
    --love.graphics.print("PRESS ANY KEY TO START P TO TOGGLE FULLSCREEN",0,500,0,1,1)
    --love.graphics.print("RESTART TO APPLY CONFIG I TO INVENTORY",0,550,0,1,1)
    --love.graphics.print("WASD TO MOVE SPACE TO INTERACT/MINE",0,600,0,1,1)
    --love.graphics.print("N TO DISMANTILE TOUCHING BUILDING",0,650,0,1,1)
    --love.graphics.print("L TO CREATE CRAFTTABLE WHILE HOVER IRONORE",0,700,0,1,1)
    love.graphics.setColor(1,1,1)
        end
    else
        gamedraw()
    end
    if mousedebug then
        love.graphics.setColor(0,1,0)
        love.graphics.print((love.mouse.getX().." "..love.mouse.getY()),0,0,0,1,1)
        love.graphics.setColor(1,1,1)
    end
    mouse.draw()
end