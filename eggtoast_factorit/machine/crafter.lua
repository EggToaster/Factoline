crafter={
    hasitem = function (i)
        local obnbt = obj.list[i].nbt
        obj.list[i].nbt.timer=obj.list[i].nbt.timer-1
        if obnbt.timer==0 then
            
        end
    end,
    noitem = function (i)
        obj.list[i].nbt.timer=120
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
        if love.mouse.isDown(1) then
            if mdcrafting then
            for aai = 1,#craftbenchsquareposhover do
                if craftbenchsquareposhover[aai].hover==0 then
                    if craftrecipe.list[aai+sca].result==nil then else
                        recip = craftrecipe.list[aai+sca]
                        obj.list[i].nbt.recipe=recip
                    end
                end
            end
            end
        mdcrafting = false
    else
        mdcrafting = true
        end
        if obj.list[i].nbt.recipe==nil then else
            local temmmp = obj.list[i]
            local tp = obj.list[i].nbt.recipe.ingrelist
            if table.contains(temmmp.nbt.inv,tp[1]) then
                table.remove(tp,1)
                if #tp ==0 then
                    crafter.hasitem(i)
                else
                if table.contains(temmmp.nbt.inv,tp[2]) then
                    table.remove(tp,2)
                    if #tp ==0 then
                        crafter.hasitem(i)
                    else
                    if table.contains(temmmp.nbt.inv,tp[3]) then
                        table.remove(tp,3)
                        if #tp ==0 then
                            crafter.hasitem(i)
                        else
                        if table.contains(temmmp.nbt.inv,tp[4]) then
                            table.remove(tp,4)
                            if #tp ==0 then
                                crafter.hasitem(i)
                            else
                            if table.contains(temmmp.nbt.inv,tp[5]) then
                                table.remove(tp,5)
                                if #tp ==0 then
                                    crafter.hasitem(i)
                                else
                                if table.contains(temmmp.nbt.inv,tp[6]) then
                                    table.remove(tp,6)
                                    if #tp ==0 then
                                        crafter.hasitem(i)
                                    end
                                else
                                    crafter.noitem(i)
                                end
                            end
                        else
                            crafter.noitem(i)
                            end
                        end
                    else
                        crafter.noitem(i)
                        end
                    end
                else
                    crafter.noitem(i)
                    end
                end
            else
                crafter.noitem(i)
                end
            end
        else
            crafter.noitem(i)
            end
        end
    end,
    draw = function (i)
        if inv.open == 1 then
            love.graphics.setColor(1,1,1)
            local tpp = obj.list[i].nbt
            love.graphics.rectangle("fill",335,55,30,30)
            love.graphics.rectangle("fill",335,90,30,30)
            love.graphics.rectangle("fill",335,125,30,30)
            love.graphics.rectangle("fill",335,160,30,30)
            love.graphics.rectangle("fill",335,195,30,30)
            love.graphics.rectangle("fill",335,230,30,30)
            love.graphics.rectangle("fill",300,55,30,30)
            if tpp.invslt2.id==nil then else
                love.graphics.draw(gr.texture.gettex(tpp.invslt2.id),300,55,0,0.065,0.065)
            end
            if tpp.inv[1].id==nil then else
                love.graphics.draw(gr.texture.gettex(tpp.inv[1].id),335,55,0,0.065,0.065)
            end
            if tpp.inv[2].id==nil then else
                love.graphics.draw(gr.texture.gettex(tpp.inv[2].id),335,55,0,0.065,0.065)
            end
            if tpp.inv[3].id==nil then else
                love.graphics.draw(gr.texture.gettex(tpp.inv[3].id),335,55,0,0.065,0.065)
            end
            if tpp.inv[4].id==nil then else
                love.graphics.draw(gr.texture.gettex(tpp.inv[4].id),335,55,0,0.065,0.065)
            end
            if tpp.inv[5].id==nil then else
                love.graphics.draw(gr.texture.gettex(tpp.inv[5].id),335,55,0,0.065,0.065)
            end
            if tpp.inv[6].id==nil then else
                love.graphics.draw(gr.texture.gettex(tpp.inv[6].id),335,55,0,0.065,0.065)
            end
            
        love.graphics.setColor(1,1,1)
        love.graphics.print(lang.gettxt("item.crafter.name"),55,245,0,0.5,0.5)
        insqp=craftbenchsquarepos
            ai=i
            --for aaai = 1,#craftbenchx do 
           --     love.graphics.setColor(1,1,1)
          --      love.graphics.rectangle("fill",craftbenchx[aaai],craftbenchsquarepos[ai].y,30,30)
          --      love.graphics.setColor(0,0,0)
          --  end
          mx,my = love.mouse.getPosition()
            for iaz = 1, #craftbenchsquarepos do
                if ((mx - insqp[iaz].x) > 0) and ((mx - insqp[iaz].x) <= 25) and ((my - insqp[iaz].y) > 0) and ((my - insqp[iaz].y) <= 25) then        
                    craftbenchsquareposhover[iaz].hover=0
                else
                    craftbenchsquareposhover[iaz].hover=1
                end
                gr.draw.square(craftbenchsquarepos[iaz].x,craftbenchsquarepos[iaz].y,30,30,"fill",craftbenchsquareposhover[iaz].hover,craftbenchsquareposhover[iaz].hover,craftbenchsquareposhover[iaz].hover)
                ai=i
                for ia = 1,#craftbenchx do 
                    gr.draw.square(craftbenchx[ia],craftbenchsquarepos[iaz].y,30,30,"fill",1,1,1)
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