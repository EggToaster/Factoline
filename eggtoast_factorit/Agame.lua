function gameload()
    yesspd = 1
    require("api.spec.controller")
end

function gamedraw()
    local dx,dy = love.graphics.getDimensions()
if not loading then
    love.graphics.setBackgroundColor(0,0,0)
    drawNoise()
    love.graphics.setColor(1,1,1)
    cam:attach()
    obj.draw()
    plr.itemdraw()
    cam:detach()
    love.graphics.setColor(0,0,0,0.25)
    love.graphics.rectangle("fill",0,0,900,100)
    love.graphics.setColor(0,0,0,0.5)
    love.graphics.rectangle("fill",100*plr.hotselect-100,0,100,100)
    love.graphics.setColor(1,1,1)
    for i = 1,9 do
        if plr.inventory[i+32].id == nil then else
            love.graphics.draw(gr.texture.gettex(plr.inventory[i+32].id),(i-1)*100,0,0,0.2,0.2)
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
        love.graphics.draw(gr.texture.gettex("crafttable"),295,170,0,0.065,0.065)
    end
    obj.drawobjgui()
    love.graphics.setColor(.25,.25,.25)
    love.graphics.rectangle("fill",dx-(150/512)*dx,110,(150/512)*dx,(150/512)*dx)
    love.graphics.stencil(function ()
        love.graphics.rectangle("fill",dx-(145/512)*dx,115,(145/512)*dx,(145/512)*dx)
    end,"replace",1)
    love.graphics.setStencilTest("greater", 0)
    love.graphics.setColor(1,1,1)
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
    love.graphics.circle('fill',dx/1.27+(145/2000)*dx,dy/2+(-275/1700)*dy,15)
    love.graphics.setStencilTest()
    if not device.console then
        donut.draw(0,100)
    end
end
end


function gameupdate(dt)
    obj.tick(dt)
    plr.itemsys()
    inv.sys()
    if not device.console then
    donut.update(fps, love.timer.getFPS())
    donut.update(xdebug,plr.x)
    donut.update(ydebug,plr.y)
    end
    local sx,sy=love.graphics.getDimensions()
    dividewidth  =sx/2
    divideheight =sy/2
    controller.tick(dt)
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
end