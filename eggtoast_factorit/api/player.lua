grabbing={id=nil}
plr={
    x=mapx/2,
    y=mapy/2,
    handrot=0,
    craftopen=false,
    rot="right",
    inventory={},
    hotselect=1,
    itemsys = function ()
        grabbing=plr.inventory[plr.hotselect+32]
        if #plr.inventory < 42 then
                table.insert(plr.inventory,{id=nil})
        end
        local isdownspace = false
        if joymode then
            isdownspace = joysticks:isGamepadDown("a")
        else
            isdownspace = love.keyboard.isDown("space")
        end
        if isdownspace then
            if grabbing.id =="crafttable" then
                obj.gen.make("craftbench",plr.x,plr.y,"crafttable",{craftopen=false})
                plr.inventory[plr.hotselect+32]={id=nil}
            end
            if table.contains(obj.placeable,grabbing.id) then
                obj.gen.make(grabbing.id.."plcd",plr.x,plr.y,grabbing.id,obj.placeablenbt[indexOf(obj.placeable,grabbing.id)])
                plr.inventory[plr.hotselect+32]={id=nil}
            end
        end
    end,
    itemdraw = function ()
        if plr.rot=="left"then
            love.graphics.draw(gr.texture.gettex("character1"),plr.x-25,plr.y-50,0,0.1,0.1)
        else
            love.graphics.draw(gr.texture.gettex("character1"),plr.x+25,plr.y-50,0,-0.1,0.1)
            end
            if plr.handrot==1 then
            if plr.rot=="left"then
                love.graphics.draw(gr.texture.gettex("hand"),plr.x+4-25,plr.y+25,11,0.1,0.1)
                else
                love.graphics.draw(gr.texture.gettex("hand"),plr.x+25,plr.y+25,-11,-0.1,0.1)
                end
            else
                if plr.rot=="left"then
                    love.graphics.draw(gr.texture.gettex("hand"),plr.x+10-25,plr.y+22-50,0,0.1,0.1)
                    else
                    love.graphics.draw(gr.texture.gettex("hand"),plr.x+13,plr.y+22-50,0,-0.1,0.1)
                    end
            end
        if plr.inventory[plr.hotselect+32].id ==nil then
        else
            local sx = 0.1
            local sy = 0.1
            local xoff=0
            local xoff2=0
            local yoff2=0
            local diroff=0
            if plr.rot=="left" then
                sx = sx * -1
                sy = sy * -1
                xoff= 75
                xoff2=-25
                yoff2=25
                diroff=10
            end
        if plr.handrot==1 then
                love.graphics.draw(gr.texture.gettex(plr.inventory[plr.hotselect+32].id),plr.x+12+xoff+xoff2,plr.y-50+yoff2,45+diroff,sx,sy)
            else
                    love.graphics.draw(gr.texture.gettex(plr.inventory[plr.hotselect+32].id),plr.x-32+xoff,plr.y+20-50,0,sx,0.1)
            end
    end
end
}