mecharmstat=0
mecharm={
    tick=function (i)
        mx,my = mouse.getPos()
        if mouse.ison(1) then
            if mdcrafting then
                if mecharmstat==1 then
                    mx,my = mouse.getPos()
                    mx,my = cam:mousePosition()
                    --print("debug "..tostring(mx)..tostring(my))
                    for sr = 1,#obj.list do
                        ox,oy = obj.list[sr].x,obj.list[sr].y
                        if table.contains(obj.sizemapid,obj.list[sr].name) then
                            sz = obj.sizemap[indexOf(obj.sizemapid,obj.list[sr].name)]
                        else
                            sz = 0.4
                        end
                        --print(tostring(mx).." a "..tostring(ox))
                        --print(tostring(my).." b "..tostring(oy))
                        if ((mx - ox) > 0) and ((mx - ox) <= sz*200) and ((my - oy) > 0) and ((my - oy) <=sz*200) then
                            local tppmp=obj.list[sr].id
                            print(tostring(tppmp:gsub("plcd","")))
                            if table.contains(obj.plctag.hasslot2,tppmp) or table.contains(obj.plctag.slot1bothio,tppmp) then--:gsub("plcd","")) then
                            obj.list[i].machine1=sr
                            --print("break "..tostring(obj.list[i].machine1))
                            break
                            end
                        end
                    end
                    mecharmstat=0
            end
            if mecharmstat==2 then
                mx,my = mouse.getPos()
                mx,my = cam:mousePosition()
                --print("debug "..tostring(mx)..tostring(my))
                for sr = 1,#obj.list do
                    ox,oy = obj.list[sr].x,obj.list[sr].y
                    if table.contains(obj.sizemapid,obj.list[sr].name) then
                        sz = obj.sizemap[indexOf(obj.sizemapid,obj.list[sr].name)]
                    else
                        sz = 0.4
                    end
                    --print(tostring(mx).." a "..tostring(ox))
                    --print(tostring(my).." b "..tostring(oy))
                    if ((mx - ox) > 0) and ((mx - ox) <= sz*200) and ((my - oy) > 0) and ((my - oy) <=sz*200) then
                        local tppmp=obj.list[sr].id
                        print(tostring(tppmp:gsub("plcd","")))
                        if table.contains(obj.plctag.hasslot,tppmp) or table.contains(obj.plctag.slot1bothio,tppmp) then
                        obj.list[i].machine2=sr
                        --print("break "..tostring(obj.list[i].machine1))
                        break
                        end
                    end
                end
                mecharmstat=0
            else
        print("moreaaaa")
                if ((mx - 300) > 0) and ((mx - 300) <= 25) and ((my - 55) > 0) and ((my - 55) <=25) then
                    item.give(obj.list[i].nbt.inv)
                    obj.list[i].nbt.inv={id=nil}
                end
                if ((mx >= 55) and (mx <= 80) and (my >= 280) and (my <= 305)) then
                    mecharmstat=1
                    print("aosdjasdojiasdijos")
                end
                if ((mx - 125) > 0) and ((mx - 125) <= 25) and ((my - 280) > 0) and ((my - 280) <=25) then
                    mecharmstat=2
                end
                if ((mx - 125) > 0) and ((mx - 125) <= 25) and ((my - 280) > 0) and ((my - 280) <=25) then
                    item.give(obj.list[i].nbt.inv)
                    obj.list[i].nbt.inv={id=nil}
                end
            end
        end
            mdcrafting=false
        else
            mdcrafting=true
        end
        obn=obj.list[i].nbt
        if obn.machine1==nil then else
            if obn.machine2==nil then else
                
            end
        end
    end,
    draw=function (i)
        if inv.open==1 then
        obnbt=obj.list[i].nbt
        objct=obj.list[i]
        cam:attach()
        if objct.machine1==nil then else
            love.graphics.setColor(1,0,0)
            love.graphics.circle("line",obj.list[objct.machine1].x+(obj.getsize(i)*500),obj.list[objct.machine1].y+(obj.getsize(i)*500),100)
            love.graphics.circle("line",obj.list[objct.machine1].x+(obj.getsize(i)*500),obj.list[objct.machine1].y+(obj.getsize(i)*500),10)
        end
        if objct.machine2==nil then else
            love.graphics.setColor(0,0,1)
            love.graphics.circle("line",obj.list[objct.machine2].x+(obj.getsize(i)*500),obj.list[objct.machine2].y+(obj.getsize(i)*500),100)
            love.graphics.circle("line",obj.list[objct.machine2].x+(obj.getsize(i)*500),obj.list[objct.machine2].y+(obj.getsize(i)*500),10)
        end
        cam:detach()

        love.graphics.print(lang.gettxt("item.mecharm.desc"),55,260,0,0.5,0.5)
        love.graphics.setColor(0,1,0)
        love.graphics.rectangle("fill",300,55,30,30)
        love.graphics.setColor(1,0,0)
        love.graphics.rectangle("fill",55,280,30,30)
        love.graphics.setColor(1,1,1)
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
        if objct.machine1==nil then else
            --print("debug")
            --print("aa "..obj.list[objct.machine1].id)
            love.graphics.draw(gr.texture.gettex(obj.list[objct.machine1].id),55,280,0,0.065,0.065)
        end
        if objct.machine2==nil then else
            love.graphics.draw(gr.texture.gettex(obj.list[objct.machine2].id),125,280,0,0.065,0.065)
        end
    end
    if mecharmstat==1 then
        love.graphics.setColor(1,0,0)
        love.graphics.print(lang.gettxt("item.mecharm.setstuff1"),55,315,0,0.5,0.5)
    end
    if mecharmstat==2 then
        love.graphics.setColor(0,0,1)
        love.graphics.print(lang.gettxt("item.mecharm.setstuff2"),55,315,0,0.5,0.5)
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