require("loadapi")
clicktitle=false
ftd=false
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
    if nextPresenceUpdate < love.timer.getTime() then
        if title then
        discordRPC.updatePresence(presencetitle)
        else
        discordRPC.updatePresence(presencegame)
        end
        nextPresenceUpdate = love.timer.getTime() + 2.0
    end
    discordRPC.runCallbacks()
    if title and stng then
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
        end
        else
        if title then
        mousecoordx,mousecoordy = love.mouse.getPosition()
        if love.mouse.isDown(1) and clicktitle==false and mousecoordx>250 and mousecoordy>350 and mousecoordx<750 and mousecoordy<500 then
            info = love.filesystem.getInfo("savegame/save1.fsg")
            if info==nil then
            plr.x=mapx/2
            plr.y=mapy/2
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
                savesys.load(json.decode(love.filesystem.read("savegame/save1.fsg")))
                title=false
            end
        end
        --love.graphics.rectangle("fill",250,525,500,150)
        --love.graphics.print("SETTINGS",275,550,0,2.5,2.5)
        if love.mouse.isDown(1) and clicktitle==false and mousecoordx>250 and mousecoordy>525 and mousecoordx<750 and mousecoordy<700 then
            stng=true
        end
    end
end
if title then
    if love.mouse.isDown(1) then
        clicktitle=true
    else
        clicktitle=false
    end
else
    gameupdate(dt)
end
end
function love.keypressed(key)
    if title then
        if key=="escape" or key=="e" then
        love.event.quit()
        else
    if key=="f11" then
        love.graphics.captureScreenshot("factorit-"..tostring(os.time))
    end
    if key=="p" then
            if ftd then else
            readres = conf.fullscreen
            if readres=="true" then
                towrite="false"
            else
                towrite="true"
            end
            conf.fullscreen=towrite
            love.filesystem.write("cfg.json",json.encode(conf))
            ftd =true
        end
    end
end
    else
        gamekey(key)
    end
end
function love.mousepressed(x,y,b)
    inv.mouseclick(x,y,b)
  end

















function gamekey(key)
    if key == "=" then
---@diagnostic disable-next-line: undefined-field
        ---@diagnostic disable-next-line: undefined-field
		debug.toggle()
	end
    if love.keyboard.isDown("escape") then
        if love.keyboard.isDown("l") then
            savesys.savegame()
        title=true
        else
            plr.craftopen=false
            inv.open = 0
        end
    end
end





function gamedraw()
    cam:attach()
    obj.draw()
    if loading==1 then
    else
        love.graphics.setBackgroundColor(255,255,255)
    if plr.rot=="left"then
        love.graphics.draw(gr.texture.gettex("character1"),plr.x,plr.y,0,0.1,0.1)
        else
        love.graphics.draw(gr.texture.gettex("character1reverse"),plr.x,plr.y,0,0.1,0.1)
        end
        if plr.handrot==1 then
        if plr.rot=="left"then
            love.graphics.draw(gr.texture.gettex("handud"),plr.x+4,plr.y+22,0,0.1,0.1)
            else
            love.graphics.draw(gr.texture.gettex("handreverseud"),plr.x-4,plr.y+22,0,0.1,0.1)
            end
        else
            if plr.rot=="left"then
                love.graphics.draw(gr.texture.gettex("hand"),plr.x+10,plr.y+22,0,0.1,0.1)
                else
                love.graphics.draw(gr.texture.gettex("handreverse"),plr.x-10,plr.y+22,0,0.1,0.1)
                end
        end
        plr.itemdraw()
    cam:detach()
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",100*plr.hotselect-100,0,100,100)
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gr.texture.gettex("hotbar"),0,0)
    for ai = 1,9 do
        i = ai + 32
    if plr.inventory[i].id == nil then
    else
        tmp = i-1
        love.graphics.draw(gr.texture.gettex(plr.inventory[i].id),tmp*100,0,0,0.2,0.2)
    end
end
love.graphics.setColor(1,1,1)
inv.draw()
love.graphics.setColor(255,255,255)
---@diagnostic disable-next-line: undefined-field
debug.draw()
---@diagnostic disable-next-line: undefined-field
debug.draw()
cam:attach()
    obj.draw()
    if loading==1 then
    else
        love.graphics.setBackgroundColor(255,255,255)
    if plr.rot=="left"then
        love.graphics.draw(gr.texture.gettex("character1"),plr.x,plr.y,0,0.1,0.1)
        else
        love.graphics.draw(gr.texture.gettex("character1reverse"),plr.x,plr.y,0,0.1,0.1)
        end
        if plr.handrot==1 then
        if plr.rot=="left"then
            love.graphics.draw(gr.texture.gettex("handud"),plr.x+4,plr.y+22,0,0.1,0.1)
            else
            love.graphics.draw(gr.texture.gettex("handreverseud"),plr.x-4,plr.y+22,0,0.1,0.1)
            end
        else
            if plr.rot=="left"then
                love.graphics.draw(gr.texture.gettex("hand"),plr.x+10,plr.y+22,0,0.1,0.1)
                else
                love.graphics.draw(gr.texture.gettex("handreverse"),plr.x-10,plr.y+22,0,0.1,0.1)
                end
        end
    end
    plr.itemdraw()
    cam:detach()

    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",100*plr.hotselect-100,0,100,100)
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gr.texture.gettex("hotbar"),0,0)
    for i = 1,9 do
        ia = i + 32
    if plr.inventory[ia].id == nil then
    else
        tmp = i-1
        love.graphics.draw(gr.texture.gettex(plr.inventory[ia].id),tmp*100,0,0,0.2,0.2)
    end
end
inv.draw()
love.graphics.setColor(255,255,255)
---@diagnostic disable-next-line: undefined-field
debug.draw(10,200)
obj.drawobjgui()
end
end





function gameupdate(dt)
    obj.tick(dt)
    plr.itemsys()
    inv.sys()
    ---@diagnostic disable-next-line: undefined-field
    debug.update(fps, love.timer.getFPS())
    ---@diagnostic disable-next-line: undefined-field
	debug.update(random,tostring(#obj.list))
    ---@diagnostic disable-next-line: undefined-field
    debug.update(xdebug,plr.x)
    ---@diagnostic disable-next-line: undefined-field
    debug.update(ydebug,plr.y)
    ---@diagnostic disable-next-line: undefined-field
    debug.update(invdbg,tostring(plr.inventory[1].id)..tostring(plr.inventory[2].id)..tostring(plr.inventory[3].id)..tostring(plr.inventory[4].id)..tostring(plr.inventory[5].id).." "..#plr.inventory)
    tmp1,tmp2=love.graphics.getDimensions()
    dividewidth  =tmp1/2
    divideheight =tmp2/2
    if true then
    if plr.x>mapx then
        plr.x=mapx
    end
    if plr.y>mapx then
        plr.y=mapx
    end
    if plr.x<0 then
        plr.x=0
    end
    if plr.y<0 then
        plr.y=0
    end
    if love.keyboard.isDown("1") then
        plr.hotselect=1
    end
    if love.keyboard.isDown("2") then
        plr.hotselect=2
    end
    if love.keyboard.isDown("3") then
        plr.hotselect=3
    end
    if love.keyboard.isDown("4") then
        plr.hotselect=4
    end
    if love.keyboard.isDown("5") then
        plr.hotselect=5
    end
    if love.keyboard.isDown("6") then
        plr.hotselect=6
    end
    if love.keyboard.isDown("7") then
        plr.hotselect=7
    end
    if love.keyboard.isDown("8") then
        plr.hotselect=8
    end
    if love.keyboard.isDown("9") then
        plr.hotselect=9
    end
    if love.keyboard.isDown("w") then
        plr.y=plr.y-dt*100
    end
    if love.keyboard.isDown("a") then
        plr.x=plr.x-dt*100
        plr.rot="left"
    end
    if love.keyboard.isDown("s") then
        plr.y=plr.y+dt*100
    end
    if love.keyboard.isDown("d") then
        plr.x=plr.x+dt*100
        plr.rot="right"
    end
    if love.keyboard.isDown("i") then
        if invkeypress==0 then
        if inv.open==1 then
            inv.open=0
        else
            inv.open=1
        end
        invkeypress=1
    end
end
if love.keyboard.isDown("l") then
    if crtkeypress then
        if plr.inventory[hvrinv] == nil then else
        if plr.inventory[hvrinv].id == "ironore" then
        plr.inventory[hvrinv].id="crafttable"
        end
    end
    end
    crtkeypress=true
else
    crtkeypress=true
end
end
if love.keyboard.isDown("i") then
else
    invkeypress=0
end
if love.keyboard.isDown("space")then
        plr.handrot=1
        keyspacepress=1
else
    plr.handrot=0
    keyspacepress=0
end
cam:lookAt(plr.x,plr.y)
end


































function love.wheelmoved(x, y)
    if title then

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
fntgame = love.graphics.newFont("rmpfont.ttf",30)
love.graphics.setFont(fntgame)
function love.draw()
    if title then
        if stng then
            love.graphics.rectangle("line",0,0,250,150)
            love.graphics.setColor(1,1,1)
            love.graphics.rectangle("fill",0,0,250,150)
            love.graphics.setColor(0,0,0)
            love.graphics.print(lang.gettxt("title.back"),25,25,0,2.5,2.5)
            love.graphics.rectangle("line",250,500,500,150)
            love.graphics.setColor(1,1,1)
            love.graphics.rectangle("fill",250,500,500,150)
            love.graphics.setColor(0,0,0)
            love.graphics.print(lang.gettxt("title.lang"),275,525,0,2.5,2.5)
            love.graphics.rectangle("line",250,350,500,150)
            love.graphics.setColor(1,1,1)
            love.graphics.rectangle("fill",250,350,500,150)
            love.graphics.setColor(0,0,0)
            love.graphics.print(lang.gettxt("title.fullscreen"),275,350,0,2.5,2.5)
            if ftd then
                love.graphics.print(lang.gettxt("title.fullscreentogglewarn"),325,350,0,0.75,0.75)
            end
            if conf.fullscreen then
                love.graphics.setColor(0,0,1)
            else
                love.graphics.setColor(1,0,0)
            end
            love.graphics.print(tostring(conf.fullscreen),250,350,0,1,1)
            love.graphics.setColor(0,0,0)
        else
    love.graphics.setBackgroundColor(1,1,1)
    love.graphics.draw(titleimg,0,0)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line",250,350,500,150)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill",250,350,500,150)
    love.graphics.setColor(0,0,0)
    love.graphics.print(lang.gettxt("title.playbutton"),275,375,0,2.5,2.5)
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
end