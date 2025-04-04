plr={
    x=mapx/2,
    y=mapy/2,
    handrot=0,
    craftopen=false,
    rot="right",
    inventory={},
    hotselect=1,
    grabbing = {id=nil},
    _mclk = false,
    itemsys = function ()
        if #plr.inventory < 42 then
            while #plr.inventory < 42 do
                table.insert(plr.inventory,{id=nil})
            end
        end
        plr.grabbing=plr.inventory[plr.hotselect+32]
        local mx,my = mouse.getPos()
        if mouse.ison(1) then
            if not plr._mclk then
                if table.contains(obj.placeable,plr.grabbing.id) then
                    local sz = ((table.contains(obj.sizemapid,plr.grabbing.id.."plcd")) and (obj.sizemap[table.indexof(obj.sizemapid,plr.grabbing.id.."plcd")]) or (0.4))
                    local tmpx,tmpy = cam:worldCoords(mx-(250*sz),my-(250*sz))
                    obj.make(plr.grabbing.id.."plcd",tmpx,tmpy,obj.placeablenbt[table.indexof(obj.placeable,plr.grabbing.id)],plr.grabbing.id)
                    plr.inventory[plr.hotselect+32]={id=nil}
                end
            end
            plr._mclk = true
        else
            plr._mclk = false
        end
    end,
    itemdraw = function ()
        local dx,dy = love.graphics.getDimensions()
        dx = dx /2
        dy = dy /2
        local wow = 0.1 * ((plr.rot=="left") and 1 or -1)
        love.graphics.draw(texture.gettex("character1"),dx-25,dy-50,0,wow,0.1)
        if plr.handrot==1 then
            if plr.rot=="left"then
                    love.graphics.draw(texture.gettex("hand"),dx+4-25,dy+25,11,0.1,0.1)
                else
                    love.graphics.draw(texture.gettex("hand"),dx+25,dy+25,-11,-0.1,0.1)
                end
            else
                if plr.rot=="left"then
                    love.graphics.draw(texture.gettex("hand"),dx+10-25,dy+22-50,0,0.1,0.1)
                else
                    love.graphics.draw(texture.gettex("hand"),dx+13,dy+22-50,0,-0.1,0.1)
                end
            end
            if not (plr.inventory[plr.hotselect+32].id ==nil) then
                local sx = 0.1 * ((plr.rot=="left") and 1 or -1)
                local sy = 0.1 * ((plr.rot=="left") and 1 or -1)
                local xoff = (plr.rot=="left") and 0 or 75
                local xoff2=(plr.rot=="left") and 0 or -25
                local yoff2=(plr.rot=="left") and 0 or 25
                local diroff=(plr.rot=="left") and 0 or 10
            if plr.handrot==1 then
                love.graphics.draw(texture.gettex(plr.inventory[plr.hotselect+32].id),dx+12+xoff+xoff2,dy-50+yoff2,45+diroff,sx,sy)
            else
                love.graphics.draw(texture.gettex(plr.inventory[plr.hotselect+32].id),dx-32+xoff,dy+20-50,0,sx,0.1)
            end
        end
        if table.contains(obj.placeable,plr.grabbing.id) then
            local mx,my = mouse.getPos()
            love.graphics.setColor(.25,1,.25)
            local sz = ((table.contains(obj.sizemapid,plr.grabbing.id.."plcd")) and (obj.sizemap[table.indexof(obj.sizemapid,plr.grabbing.id.."plcd")]) or (0.4))
            love.graphics.draw(texture.gettex(plr.grabbing.id.."plcd"),mx-(250*sz),my-(250*sz),0,sz,sz)
            love.graphics.setColor(1,1,1)
        end
    end
}