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
        if controller.abutton() then
            if grabbing.id =="crafttable" then
                obj.make("craftbench",plr.x,plr.y,{craftopen=false},"crafttable")
                plr.inventory[plr.hotselect+32]={id=nil}
            else
                if table.contains(obj.placeable,grabbing.id) then
                    obj.make(grabbing.id.."plcd",plr.x,plr.y,obj.placeablenbt[indexOf(obj.placeable,grabbing.id)],grabbing.id)
                    plr.inventory[plr.hotselect+32]={id=nil}
                end
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
            if not (plr.inventory[plr.hotselect+32].id ==nil) then
                local sx = (plr.rot=="left") and 0.1 or -0.1
                local sy = (plr.rot=="left") and 0.1 or -0.1
                local xoff = (plr.rot=="left") and 0 or 75
                local xoff2=(plr.rot=="left") and 0 or -25
                local yoff2=(plr.rot=="left") and 0 or 25
                local diroff=(plr.rot=="left") and 0 or 10
            if plr.handrot==1 then
                love.graphics.draw(gr.texture.gettex(plr.inventory[plr.hotselect+32].id),plr.x+12+xoff+xoff2,plr.y-50+yoff2,45+diroff,sx,sy)
            else
                love.graphics.draw(gr.texture.gettex(plr.inventory[plr.hotselect+32].id),plr.x-32+xoff,plr.y+20-50,0,sx,0.1)
            end
        end
    end
}