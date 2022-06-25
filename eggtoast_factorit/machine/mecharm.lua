mecharmstat=0
mecharm={
    tick=function (i)
        mx,my = love.mouse.getPosition()
        if love.mouse.isDown(1) then
            if mdcrafting then
                if ((mx - 300) > 0) and ((mx - 300) <= 25) and ((my - 55) > 0) and ((my - 55) <=25) then
                    item.give(obj.list[i].nbt.inv)
                    obj.list[i].nbt.inv={id=nil}
                end
                if ((mx - 55) > 0) and ((mx - 55) <= 25) and ((my - 280) > 0) and ((my - 280) <=25) then
                    mecharmstat=1
                end
                if ((mx - 125) > 0) and ((mx - 125) <= 25) and ((my - 280) > 0) and ((my - 280) <=25) then
                    item.give(obj.list[i].nbt.inv)
                    obj.list[i].nbt.inv={id=nil}
                end
            end
            mdcrafting=false
        else
            mdcrafting=true
        end
    end,
    draw=function (i)
        if inv.open==1 then
        obnbt=obj.list[i].nbt
        if obnbt.machine1==nil then else
            love.graphics.setColor(1,0,0)
            love.graphics.circle("line",obj.list[obnbt.machine1].x,obj.list[obnbt.machine1].y,5)
            end
            if obnbt.machine2==nil then else
            love.graphics.setColor(0,0,1)
            love.graphics.circle("line",obj.list[obnbt.machine2].x,obj.list[obnbt.machine2].y,5)
            end
        love.graphics.print(lang.gettxt("item.mecharm.desc"),55,260,0,0.5,0.5)
        love.graphics.setColor(0,1,0)
        love.graphics.rectangle("fill",300,55,30,30)
        love.graphics.setColor(1,0,0)
        love.graphics.rectangle("fill",55,280,30,30)
        love.graphics.setColor(1,1,1)
---@diagnostic disable-next-line: redundant-parameter
        love.graphics.line(90,290,90,300,105,300,105,305,125,295,105,280,105,290,90,290)
        love.graphics.setColor(0,0,1)
        love.graphics.rectangle("fill",125,280,30,30)
        love.graphics.setColor(1,1,1)
        love.graphics.rectangle("line",55,280,30,30)
        love.graphics.rectangle("line",125,280,30,30)
        love.graphics.setColor(1,1,1)
        love.graphics.print(lang.gettxt("item.mecharm.name"),55,245,0,0.5,0.5)
        if obnbt.inv.id==nil then else
            love.graphics.draw(gr.texture.gettex(obnbt.inv.id),300,55,0,0.065,0.065)
        end
    end
    if mecharmstat==1 then
        love.graphics.setColor(0,0,1)
        love.graphics.print(lang.gettxt("item.mecharm.setstuff1"),55,315,0,0.5,0.5)
    end
    end,
    crafttableput = function (x,y)
        local ob2 = plr.inventory[(y-1)*8+x]
        local ob3 = (y-1)*8+x
        print("mecharmput."..tostring(ob3))
        obj.list[plr.craftopeni].nbt.inv = ob2
        item.delete(ob2)
    end,
    toggleopen = function(i)
        if obj.list[i].nbt.craftopen==true then
            obj.list[i].nbt.craftopen=false
            plr.craftopen=false
            mecharmuse=false
            plr.craftopeni=nil
            print("craftoff")
        else
            if plr.craftopen==false then
            obj.list[i].nbt.craftopen=true
            plr.craftopen=true
            mecharmuse = true
            plr.craftopeni=i
            print("crafton")
            end
        end
    end
}