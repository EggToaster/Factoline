function gamekey(key)
    if love.keyboard.isDown("c") then
        spdrun = spdrun + 1
        if spdrun==6 then
            spdrun=1
        end
    end
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
            crafteruse=false
            plr.craftopeni=nil
            print("craftoff")
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
end


function gamedraw()
    if not loading then
    love.graphics.setBackgroundColor(1,1,1)
    love.graphics.setColor(1,1,1)
    donut.draw()
    cam:attach()
    obj.draw()
    --love.graphics.draw(gr.texture.gettex("slider"),100,0)
        love.graphics.setBackgroundColor(255,255,255)
    if plr.rot=="left"then        ---@diagnostic disable-next-line: param-type-mismatch
        love.graphics.draw(gr.texture.gettex("character1"),plr.x-25,plr.y-50,0,0.1,0.1)
        else        ---@diagnostic disable-next-line: param-type-mismatch
        love.graphics.draw(gr.texture.gettex("character1reverse"),plr.x-25,plr.y-50,0,0.1,0.1)
        end
        if plr.handrot==1 then
        if plr.rot=="left"then
            love.graphics.draw(gr.texture.gettex("handud"),plr.x+4-25,plr.y+22-50,0,0.1,0.1)
            else
            love.graphics.draw(gr.texture.gettex("handreverseud"),plr.x-4-25,plr.y+22-50,0,0.1,0.1)
            end
        else
            if plr.rot=="left"then
                love.graphics.draw(gr.texture.gettex("hand"),plr.x+10-25,plr.y+22-50,0,0.1,0.1)
                else
                love.graphics.draw(gr.texture.gettex("handreverse"),plr.x-10-25,plr.y+22-50,0,0.1,0.1)
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
if inv.open==1 then
    love.graphics.setColor(1,1,1)
    love.graphics.draw(gr.texture.gettex("crafttable"),295,170,0,0.065,0.065)
end
love.graphics.setColor(255,255,255)
---@diagnostic disable-next-line: undefined-field
donut.draw(10,200)
obj.drawobjgui()
local sx,sy = love.graphics.getDimensions()
love.graphics.setColor(.25,.25,.25)
love.graphics.rectangle("fill",sx-(150/512)*sx,110,(150/512)*sx,(150/512)*sx)
--love.graphics.print(tostring(sx),0,500)
--love.graphics.print(tostring(sy),0,525)
--love.graphics.setColor(0,1,0)
--love.graphics.circle('fill',sx/2,sy/2,15)
love.graphics.stencil(function ()
    --love.graphics.rectangle("fill",sx-145,115,(1024/140)*sx,140)
    --love.graphics.rectangle("fill",0,0,10000,10000)
    love.graphics.rectangle("fill",sx-(145/512)*sx,115,(145/512)*sx,(145/512)*sx)
end
,"replace",1)
    love.graphics.setStencilTest("greater", 0)
    love.graphics.setColor(1,1,1)
    --love.graphics.rectangle("fill",0,0,10000,10000)
    mnm:attach()
    mnm:zoomTo(0.25)
    mnm:move(0,0)
    mnm:lookAt(plr.x-(425/1215)*sx*4.17,plr.y-(-275/1715)*sy*3.8)
    --cam:lookAt(plr.x+(sx-145),plr.y+115)
    --love.graphics.draw(gr.texture.gettex("slider"),(425/1024)*sx,(-275/1024)*sy)
    for i = 1,#obj.list do
        local this = obj.list[i]
        --if not table.contains(obj.plctag.nature,this.id) then
        local cx,cy = cam:cameraCoords(this.x,this.y)
        local dx,dy = love.graphics.getDimensions()
        if cx>=-1000 and cx<=dx+1000 and cy >= -1000 and cy <= dy+1000 then
            if table.contains(obj.sizemapid,obj.list[i].id) then
                love.graphics.draw(gr.texture.gettex(obj.list[i].id),obj.list[i].x,obj.list[i].y,0,obj.sizemap[indexOf(obj.sizemapid,obj.list[i].id)]/2,obj.sizemap[indexOf(obj.sizemapid,obj.list[i].id)]/2)
            else
                love.graphics.draw(gr.texture.gettex(obj.list[i].id),obj.list[i].x,obj.list[i].y,0,0.4/2,0.4/2)
            end
        end
        --end
    end
    --love.graphics.circle('fill',sx/2,sy/2,15)
    mnm:detach()
    love.graphics.setColor(0,1,0,0.5)
    love.graphics.circle('fill',sx/1.27+(145/2000)*sx,sy/2+(-275/1700)*sy,15)
    love.graphics.setStencilTest()
end

spdrun=1
function gameupdate(dt)
    --mulplay.join()
    obj.tick(dt)
    plr.itemsys()
    inv.sys()
    donut.update(fps, love.timer.getFPS())
    donut.update(xdebug,plr.x)
    donut.update(ydebug,plr.y)
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