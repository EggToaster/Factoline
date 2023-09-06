mecharmstat=0
mecharm={
    tick=function (i)
        local mx,my = mouse.getPos()
        if mouse.ison(1) then
            if i == plr.craftopeni then
            if mdmecharm then
                if mecharmstat==1 then
                    local mx,my = cam:mousePosition()
                    for sr = 1,#obj.list do
                        ox,oy = obj.list[sr].x,obj.list[sr].y
                        if table.contains(obj.sizemapid,obj.list[sr].name) then
                            sz = obj.sizemap[indexOf(obj.sizemapid,obj.list[sr].name)]
                        else
                            sz = 0.4
                        end
                        if ((mx-ox) >= 0) and ((mx - ox) <= sz*500) and ((my - oy) > 0) and ((my - oy) <=sz*500) then
                            local tppmp=obj.list[sr].id
                            print(tostring(tppmp:gsub("plcd","")))
                            if table.contains(obj.plctag.hasslot2,tppmp) or table.contains(obj.plctag.slot1bothio,tppmp) then--:gsub("plcd","")) then
                            obj.list[i].nbt.machine1=sr
                            break
                            end
                        end
                    end
                    mecharmstat=0
                else
            if mecharmstat==2 then
                local mx,my = cam:mousePosition()
                for sr = 1,#obj.list do
                    ox,oy = obj.list[sr].x,obj.list[sr].y
                    if table.contains(obj.sizemapid,obj.list[sr].name) then
                        sz = obj.sizemap[indexOf(obj.sizemapid,obj.list[sr].name)]
                    else
                        sz = 0.4
                    end
                    if ((mx - ox) > 0) and ((mx - ox) <= sz*500) and ((my - oy) > 0) and ((my - oy) <=sz*500) then
                        local tppmp=obj.list[sr].id
                        print(tostring(tppmp:gsub("plcd","")))
                        if table.contains(obj.plctag.hasslot,tppmp) or table.contains(obj.plctag.slot1bothio,tppmp) then
                        obj.list[i].nbt.machine2=sr
                        break
                        end
                    end
                end
                mecharmstat=0
            else
                if ((mx - 300) > 0) and ((mx - 300) <= 25) and ((my - 55) > 0) and ((my - 55) <=25) then
                    item.give(obj.list[i].nbt.inv)
                    obj.list[i].nbt.inv={id=nil}
                end
                if ((mx >= 55) and (mx <= 80) and (my >= 280) and (my <= 305)) then
                    mecharmstat=1
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
        end
            mdmecharm=false
        else
            mdmecharm=true
        end
        local obn=obj.list[i].nbt
        local this=obj.list[i]
        local m1 = this.machine1
        local m2 = this.machine2
        if not (m1==nil) then
            if not (m2==nil) then
                if (table.contains(obj.plctag.slot1bothio,obj.list[m1].id)) or (table.contains(obj.plctag.hasslot2,obj.list[m1].id)) then
                        --machine 1 ready
                        if table.contains(obj.plctag.hasslot,obj.list[m2].id) then
                            local isoktoready=false
                            for ti = 1,#obj.list[m2].nbt.inv do
                                if obj.list[m2].nbt.inv[ti].id==nil then
                                    isoktoready=true
                                    break
                                end
                            end
                            if isoktoready then
                                if ((obj.list[m1].nbt[(table.contains(obj.plctag.slot1bothio,obj.list[m1].id) and "inv" or "invslt2")].id==nil)) then
                                    this.nbt.timer = this.nbt.timer-1
                                end
                                if this.nbt.timer == 0 then
                                    if this.nbt.inv.id == nil then
                                        local invorinv2 =table.contains(obj.plctag.slot1bothio,obj.list[m1].id) and "inv" or "invslt2"
                                        this.nbt.inv = obj.list[m1].nbt[invorinv2]
                                        obj.list[m1].nbt[invorinv2]={id=nil}
                                        this.nbt.timer=30
                                    else
                                        local i2 = 0
                                        for ti = 1,#obj.list[m2].nbt.inv do
                                            if obj.list[m2].nbt.inv[ti].id==nil then
                                                i2=ti
                                                break
                                            end
                                        end
                                        obj.list[m2].nbt.inv[i2]=this.nbt.inv
                                        this.nbt.inv={id=nil}
                                        this.nbt.timer=30
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
    draw=function (i)
        if inv.open==1 then
        local obnbt=obj.list[i].nbt
        local objct=obj.list[i]
        cam:attach()
        if objct.machine1==nil then else
            love.graphics.setColor(1,0,0)
            love.graphics.circle("line",obj.list[objct.machine1].x+(obj.getsize(objct.machine1)*250),obj.list[objct.machine1].y+(obj.getsize(objct.machine1)*250),250*obj.getsize(objct.machine1))
            love.graphics.circle("line",obj.list[objct.machine1].x+(obj.getsize(objct.machine1)*250),obj.list[objct.machine1].y+(obj.getsize(objct.machine1)*250),25*obj.getsize(objct.machine1))
        end
        if objct.machine2==nil then else
            love.graphics.setColor(0,0,1)
            love.graphics.circle("line",obj.list[objct.machine2].x+(obj.getsize(objct.machine2)*250),obj.list[objct.machine2].y+(obj.getsize(objct.machine2)*250),250*obj.getsize(objct.machine2))
            love.graphics.circle("line",obj.list[objct.machine2].x+(obj.getsize(objct.machine2)*250),obj.list[objct.machine2].y+(obj.getsize(objct.machine2)*250),25*obj.getsize(objct.machine2))
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
            love.graphics.draw(texture.gettex(obnbt.inv.id),300,55,0,0.065,0.065)
        end
        if objct.machine1==nil then else
            love.graphics.draw(texture.gettex(obj.list[obnbt.machine1].id),55,280,0,0.065,0.065)
        end
        if objct.machine2==nil then else
            love.graphics.draw(texture.gettex(obj.list[obnbt.machine2].id),125,280,0,0.065,0.065)
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
    mecharmput = function (x,y)
        local ob2 = plr.inventory[(y-1)*8+x]
        local ob3 = (y-1)*8+x
        print("mecharmput."..tostring(ob3))
        obj.list[plr.craftopeni].nbt.inv = ob2
        plr.inventory[ob3]={id=nil}
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