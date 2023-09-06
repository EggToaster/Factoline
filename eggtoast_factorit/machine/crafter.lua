crafter={
    hasitem = function (i)
        --print("crafter.timertick")
        local obnbt = obj.list[i].nbt
       -- print(json.encode(obj.list[i].nbt.invslt2))
        if obj.list[i].nbt.invslt2.id==nil then
            obj.list[i].nbt.timer=obj.list[i].nbt.timer-1
            if obnbt.timer==0 then
                obnbt.invslt2=obnbt.recipe.result
                obnbt.inv={{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil}}
            end
        end
    end,
    noitem = function (i)
        obj.list[i].nbt.timer=120
        --print("noitem"..tostring(math.random(1111,9999)))
    end,
    wheel = function (y)
        if y <= 0 then
            craftpage =craftpage+1
        else
            craftpage=craftpage-1
        end
        if craftpage<=0 then
            craftpage=0
        end
        if (craftpage+1)*5>=#craftrecipe.list then
            craftpage=craftpage-1
        end
    end,
    tick = function (i)
        crtouch=true
        if mouse.ison(1) and (plr.craftopeni==i) then
            if mdcrafting then
                for aai = 1,#craftbenchsquareposhover do
                    if craftbenchsquareposhover[aai].hover==0 then
                        if craftrecipe.list[aai+sca].result==nil then else
                            recip = craftrecipe.list[aai+sca]
                            obj.list[i].nbt.recipe=recip
                        end
                    end
                end
            if crafteruse then
                if crafterhover=={{hover=0},{hover=0},{hover=0},{hover=0},{hover=0},{hover=0},{hover=0},{hover=0}} then else
                    for iii = 1,8 do
                        if crafterhover[iii].hover==1 then
                            if iii==8 then
                                print(tostring(item.give(obj.list[i].nbt.invslt2)))
                                obj.list[i].nbt.invslt2={id=nil}
                            else
                                print(tostring(item.give(obj.list[i].nbt.inv[iii])))
                                obj.list[i].nbt.inv[iii]={id=nil}
                            end
                        end
                    end
                end
            end
        end
        mdcrafting = false
    else
        mdcrafting = true
    end
        if obj.list[i].nbt.recipe==nil then else
            tpp = obj.list[i].nbt.recipe.ingrelist
            for ii = 1,6 do
                if item.iHasAt(obj.list[i].nbt.inv,tpp[1],ii) then
                    if #tpp ==1 then
                        if item.getItemCount(obj.list[i].nbt.inv)==ii then
                            crafter.hasitem(i)
                        end
                    else
                        if ii == 6 then
                            crafter.noitem(i)
                        end
                    end
                end
            end
        end
    end,
    draw = function (i)
        if inv.open == 1 then
            love.graphics.setColor(1,1,1)
            local tpp = obj.list[i].nbt
            love.graphics.setColor(0,0,1)
            if crafterhover[1].hover == 1 then
                love.graphics.setColor(1,1,1)
            else
                love.graphics.setColor(0,0,1)
            end
            love.graphics.rectangle("fill",335,55,30,30)
            if crafterhover[2].hover == 1 then
                love.graphics.setColor(1,1,1)
            else
                love.graphics.setColor(0,0,1)
            end
            love.graphics.rectangle("fill",335,90,30,30)
            if crafterhover[3].hover == 1 then
                love.graphics.setColor(1,1,1)
            else
                love.graphics.setColor(0,0,1)
            end
            love.graphics.rectangle("fill",335,125,30,30)
            if crafterhover[4].hover == 1 then
                love.graphics.setColor(1,1,1)
            else
                love.graphics.setColor(0,0,1)
            end
            love.graphics.rectangle("fill",335,160,30,30)
            if crafterhover[5].hover == 1 then
                love.graphics.setColor(1,1,1)
            else
                love.graphics.setColor(0,0,1)
            end
            love.graphics.rectangle("fill",335,195,30,30)
            if crafterhover[6].hover == 1 then
                love.graphics.setColor(1,1,1)
            else
                love.graphics.setColor(0,0,1)
            end
            love.graphics.rectangle("fill",335,230,30,30)
            if crafterhover[7].hover == 1 then
                love.graphics.setColor(1,1,1)
            else
                love.graphics.setColor(0,0,1)
            end
            love.graphics.rectangle("fill",300,230,30,30)
            if crafterhover[8].hover == 1 then
                love.graphics.setColor(1,1,1)
            else
                love.graphics.setColor(1,0,0)
            end
            love.graphics.rectangle("fill",300,55,30,30)
            love.graphics.setColor(0,1,0)
            love.graphics.rectangle("fill",300,90,30,30)
            love.graphics.setColor(1,1,1)
            if tpp.invslt2.id==nil then else
                love.graphics.draw(texture.gettex(tpp.invslt2.id),300,55,0,0.065,0.065)
            end
            if tpp.recipe==nil then else
            love.graphics.draw(texture.gettex(tpp.recipe.result.id),300,90,0,0.065,0.065)
            end
            if #tpp.inv ~= 0 then
                if tpp.inv[1].id==nil then else
                    love.graphics.draw(texture.gettex(tpp.inv[1].id),335,55,0,0.065,0.065)
                end
                if tpp.inv[2].id==nil then else
                    love.graphics.draw(texture.gettex(tpp.inv[2].id),335,90,0,0.065,0.065)
                end
                if tpp.inv[3].id==nil then else
                    love.graphics.draw(texture.gettex(tpp.inv[3].id),335,125,0,0.065,0.065)
                end
                if tpp.inv[4].id==nil then else
                    love.graphics.draw(texture.gettex(tpp.inv[4].id),335,160,0,0.065,0.065)
                end
                if tpp.inv[5].id==nil then else
                    love.graphics.draw(texture.gettex(tpp.inv[5].id),335,195,0,0.065,0.065)
                end
                if tpp.inv[6].id==nil then else
                    love.graphics.draw(texture.gettex(tpp.inv[6].id),335,230,0,0.065,0.065)
                end
                if tpp.inv[7].id==nil then else
                    love.graphics.draw(texture.gettex(tpp.inv[7].id),300,230,0,0.065,0.065)
                end
            end
            
        love.graphics.setColor(1,1,1)
        love.graphics.print(lang.gettxt("item.crafter.name"),55,245,0,0.5,0.5)
        insqp = craftbenchsquarepos
        cph = {0,0,0,0,0}
            ai=i
            --for aaai = 1,#craftbenchx do 
           --     love.graphics.setColor(1,1,1)
          --      love.graphics.rectangle("fill",craftbenchx[aaai],craftbenchsquarepos[ai].y,30,30)
          --      love.graphics.setColor(0,0,0)
          --  end
          mx,my = mouse.getPos()
          for i = 1,8 do
                if ((mx - 335) > 0) and ((mx - 335) <= 25) and ((my -(55+(35*(i-1)))) > 0) and ((my -(55+(35*(i-1)))) <=25) then
                    crafterhover[i].hover=1
                else
                  crafterhover[i].hover=0
                end
          end
            for iaz = 1, #insqp do
                if ((mx - insqp[iaz].x) > 0) and ((mx - insqp[iaz].x) <= 25) and ((my - insqp[iaz].y) > 0) and ((my - insqp[iaz].y) <= 25) then        
                   cph[iaz]=0
                else
                    cph[iaz]=1
                end
                love.graphics.setColor(cph[i],cph[i],cph[i])
                love.graphics.rectangle("fill",insqp[i].x,insqp[i].y,30,30)
                love.graphics.setColor(1,1,1)
                ai=i
                for i = 1,#craftbenchx do 
                    love.graphics.rectangle("fill",craftbenchx[i],insqp[ai].y,30,30)
                end
            end
        crtdrawrec()
        love.graphics.setColor(1,1,1)
    end
    end,
    toggleopen = function(i)
        if obj.list[i].nbt.craftopen==true then
            obj.list[i].nbt.craftopen=false
            plr.craftopen=false
            crafteruse=false
            plr.craftopeni=nil
            print("craftoff")
        else
            if plr.craftopen==false then
            obj.list[i].nbt.craftopen=true
            plr.craftopen=true
            crafteruse = true
            plr.craftopeni=i
            print("crafton")
            end
        end
    end
}
crafterput = function (z,x,y)
   local obb = obj.list[plr.craftopeni].nbt.inv[z]
   local ob2 = plr.inventory[(y-1)*8+x]
   local ob3 = (y-1)*8+x
   print("crafttableput."..tostring(ob3))
   table.insert(obj.list[plr.craftopeni].nbt.inv,ob2)
   plr.inventory[ob3]={id=nil}
end
crafterhover={
    {hover=0},
    {hover=0},
    {hover=0},
    {hover=0},
    {hover=0},
    {hover=0},
    {hover=0},
    {hover=0}
}