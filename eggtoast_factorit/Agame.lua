function gameload()
    yesspd = 1
end

function gamedraw()
    local dx,dy = love.graphics.getDimensions()
    love.graphics.setBackgroundColor(1,1,1)
    love.graphics.setColor(1,1,1)
    cam:attach()
    obj.draw()
    cam:detach()
    plr.itemdraw()
    love.graphics.setColor(0,0,0,0.25)
    love.graphics.rectangle("fill",0,0,900,100)
    love.graphics.setColor(0,0,0,0.5)
    love.graphics.rectangle("fill",100*plr.hotselect-100,0,100,100)
    love.graphics.setColor(1,1,1)
    for i = 1,9 do
        if plr.inventory[i+32].id == nil then else
            love.graphics.draw(texture.gettex(plr.inventory[i+32].id),(i-1)*100,0,0,0.2,0.2)
        end
    end
    love.graphics.setColor(0,0,0)
    for i = 1,9 do
        love.graphics.line(i*100,0,i*100,100)
    end
    love.graphics.rectangle("line",1,1,900,100)
    love.graphics.setColor(1,1,1)
    inv.draw()
    if inv.open==1 then
        love.graphics.draw(texture.gettex("crafttable"),295,170,0,0.065,0.065)
    end
    obj.drawobjgui()
    love.graphics.setColor(.25,.25,.25)
    love.graphics.rectangle("fill",dx-(150/512)*dx,110,(150/512)*dx,(150/512)*dx)
    love.graphics.setColor(1,1,1)

    love.graphics.stencil(function ()
           love.graphics.rectangle("fill",dx-(145/512)*dx,115,(145/512)*dx,(145/512)*dx)
    end,"replace",1)
    love.graphics.setStencilTest("greater", 0)
        mnm:attach()
            mnm:zoomTo(0.25)
            mnm:lookAt(plr.x-(425/1215)*dx*4.17,plr.y-(-275/1715)*dy*3.8)
            for i = 1,#obj.list do
                local cx,cy = cam:cameraCoords(obj.list[i].x,obj.list[i].y)
                if cx>=-1000 and cx<=dx+1000 and cy >= -1000 and cy <= dy+1000 then
                    obj.customdraw(obj.list[i])
                end
            end
        mnm:detach()
        love.graphics.setColor(0,1,0,0.5)
        love.graphics.circle('fill',dx/1.27+(145/2000)*dx,dy/2+(-275/1700)*dy,10)
    love.graphics.setStencilTest()
end

function gameupdate(dt)
    plr.itemsys()
    inv.sys()
    obj.tick(dt)
    local sx,sy=love.graphics.getDimensions()
    dividewidth  =sx/2
    divideheight =sy/2
    if plr.x>mapx then
        plr.x=mapx
    end
    if plr.y>mapy then
        plr.y=mapy
    end
    if plr.x<0 then
        plr.x=0
    end
    if plr.y<0 then
        plr.y=0
    end
    cam:lookAt(plr.x,plr.y)

    spd=100
    if love.keyboard.isDown("lshift") then
        if spdrun == 1 then
            spd = 300
        end
        if spdrun == 2 then
            spd = 500
        end
        if spdrun == 3 then
            spd = 750
        end
        if spdrun == 4 then
            spd = 1000
        end
        if spdrun==5 then
            spd= 1500
        end
    end
    if love.keyboard.isDown("w") then
        plr.y=plr.y-dt*spd
    end
    if love.keyboard.isDown("a") then
        plr.x=plr.x-dt*spd
        plr.rot="left"
    end
    if love.keyboard.isDown("s") then
        plr.y=plr.y+dt*spd
    end
    if love.keyboard.isDown("d") then
        plr.x=plr.x+dt*spd
        plr.rot="right"
    end
    if love.keyboard.isDown("space")then
        plr.handrot=1
        keyspacepress=1
    else
        plr.handrot=0
        keyspacepress=0
    end
end

function gamekey(key)
    if love.keyboard.isDown("c") then
        spdrun = spdrun + 1
        if spdrun==6 then
            spdrun=1
        end
    end
    if love.keyboard.isDown("escape") then
        if love.keyboard.isDown("l") then
            misc.save.savegame()
            title=true
        else
            plr.craftopen=false
            crafteruse=false
            plr.craftopeni=nil
            plr.craftopen=false
            for i = 1,#obj.list do
                if table.haskey(obj.list[i].nbt,"craftopen") then
                    if obj.list[i].nbt.craftopen==true then
                        obj.list[i].nbt.craftopen=false
                    end
                end
            end
            inv.open = 0
        end
    end
    for i = 1,9 do
        if love.keyboard.isDown(tostring(i)) then
            plr.hotselect=i
        end
    end
end