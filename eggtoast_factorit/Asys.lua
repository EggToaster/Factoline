function loadSys()
    mousedebug=table.contains(arg,"-d")

    spdrun=1 --TODO: turn this to local variable without breaking system
    saveselecter=1 --TODO: same as up
    craftpage=0 --TODO: same as up

    require("Agame")
    lang.set(conf.lang)

    love.window.setFullscreen(conf.fullscreen)
    love.window.setVSync(conf.vsync)
    love.audio.setVolume(conf.mute and 0 or 1)
    if conf.alwmax then
        love.window.maximize()
    end
    gameload()
end

function startgame()
    local info = love.filesystem.getInfo("savegame/save"..tostring(saveselecter)..".fsg")
    if info==nil then
        plr.x=math.random(500,mapx-500)
        plr.y=math.random(500,mapy-500)
        plr.handrot=0
        plr.craftopen=false
        plr.rot="right"
        plr.lst = {}
        plr.inventory={}
        for i = 1, 32 do
            table.insert(plr.inventory, {id=nil})
        end
        table.insert(plr.inventory, {id="miningpick"})
        plr.hotselect=1
        obj.list={}
        title=false
        obj.genworld()
    else
        misc.save.load(love.filesystem.read("savegame/save"..tostring(saveselecter)..".fsg"))
        title=false
    end
end

function love.update(dt)
    mouse.tick(dt)
    gui.tick()
    if table.contains(arg, "-h") then
        lurker.scan()
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
        end
    else
        gamekey(key)
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
    end
end

function love.mousepressed(x,y,b,_,pr)
    mouse.mouseevent(b)
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

---@diagnostic disable-next-line: duplicate-set-field
function love.draw()
    love.graphics.setBackgroundColor(1,1,1)
    if title then
        if stng then
            gui.draw(guiload.get("settingtitle-"..stngtab))
        else
            gui.draw(guiload.get("tscreen"))
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
    if mousedebug then
        love.graphics.setColor(0,1,0)
        love.graphics.print((love.mouse.getX().." "..love.mouse.getY()),0,0,0,1,1)
        love.graphics.setColor(1,1,1)
    end
end