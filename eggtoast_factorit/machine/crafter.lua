crafter={
    wheel = function (y)
        if y <= 0 then
            craftpage=craftpage+1
        else
            craftpage=craftpage-1
        end
        if craftpage<=0 then
            craftpage=0
        end
        if craftrecipe[(craftpage*(#craftbenchx*#craftbenchy))+1] == nil then
            craftpage=craftpage-1
        end
    end,
    tick = function (i)
        local rtn = false
        if #craftbenchsquareposhover ~= #craftbenchx*#craftbenchy then
            craftbenchsquareposhover = {}
            for i = 1,#craftbenchx*#craftbenchy do
                table.insert(craftbenchsquareposhover,1)
            end
        end
        local mx,my = mouse.getPos()
        for i = 1, #craftbenchy do
            for ii = 1,#craftbenchx do
                if (mx - craftbenchx[ii] > 0) and ((mx - craftbenchx[ii]) <= 25) and ((my - craftbenchy[i]) > 0) and ((my - craftbenchy[i]) <= 25) then        
                    craftbenchsquareposhover[ii+((i-1)*#craftbenchx)]=0
                else
                    craftbenchsquareposhover[ii+((i-1)*#craftbenchx)]=1
                end
            end
        end
        if mouse.ison(1) then
            if (plr.craftopeni==i) then
                if not crafttabledown then
                    local mx,my = mouse.getPos()
                    if type(obj.list[i].nbt.invslt2)=="table" then
                        love.graphics.draw(texture.gettex(obj.list[i].nbt.invslt2.id),505,265,0,0.08,0.08)
                        if (mx >= 505) and (mx <= 505+40) and (my >= 265) and (my <= 265+40) then
                            item.give(obj.list[i].nbt.invslt2)
                            obj.list[i].nbt.invslt2={id=nil}
                        end
                    end
                    for x = 0,2 do
                        for y = 0,2 do
                            local hvr = crafterhover[(y*3)+x+1]
                            if (type(obj.list[i].nbt.inv[(y*3)+x+1])=="table") and hvr==0 then
                                item.give(obj.list[i].nbt.inv[(y*3)+x+1])
                                obj.list[i].nbt.inv[(y*3)+x+1]={id=nil}
                            end                        
                        end
                    end
                    local cbsph = craftbenchsquareposhover
                    for ii = 1,#cbsph do
                        if cbsph[ii] ==0 then 
                            if not (craftrecipe[ii+((#craftbenchx*#craftbenchy)*craftpage)] == nil) then
                                local recip = craftrecipe[ii+((#craftbenchx*#craftbenchy)*craftpage)]
                                obj.list[i].nbt.recipe=recip
                            end
                        end
                    end
                    if (mx >= 90) and (mx<=120) and (my>=265) and (my<=295) then
                        crafttable.wheel(1)
                    end
                    if (mx >= 90) and (mx<=120) and (my>=400) and (my<=430) then
                        crafttable.wheel(0)
                    end
                end
                crafttabledown = true
            end
        else
            if (plr.craftopeni == i) then
                crafttabledown = false
            end
        end
        local mx,my = mouse.getPos()
        for x = 0,2 do
            for y = 0,2 do
                crafterhover[(y*3)+x+1] = 1
                if (mx >= 405+x*50) and (mx <= 405+x*50+40) and (my >= 115+y*50) and (my <= 115+y*50+40)  then
                    crafterhover[(y*3)+x+1] = 0
                end
            end
        end
        if obj.list[i].nbt.recipe==nil then else
            tpp = obj.list[i].nbt.recipe.ingrelist
            for ii = 1,6 do
                if item.iHasAt(obj.list[i].nbt.inv,tpp[1],ii) then
                    if #tpp ==1 then
                        print("waa")
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
    draw = function(i)
        if inv.open == 1 then
            love.graphics.setColor(1,1,1)
            love.graphics.print(lang.gettxt("item.crafter.name").."              "..lang.gettxt("item.crafter.select"),55,240,0,0.25,0.25)
            for i = 1, #craftbenchy do
                for ii = 1,#craftbenchx do
                    local cbsph = craftbenchsquareposhover
                    local ishovered = cbsph[ii+((i-1)*#craftbenchx)]
                    love.graphics.setColor(ishovered,ishovered,ishovered)
                    love.graphics.rectangle("fill",craftbenchx[ii],craftbenchy[i],30,30)
                    love.graphics.setColor(1,1,1)
                end
            end
            for iii = 1,#craftbenchy do
                for ii =1,#craftbenchx do
                    if not (craftrecipe[ii+(#craftbenchx*(iii-1))+(craftpage*#craftbenchx*#craftbenchy)]==nil) then
                        love.graphics.draw(texture.gettex(craftrecipe[ii+(#craftbenchx*(iii-1))+(craftpage*#craftbenchx*#craftbenchy)].result.id),craftbenchx[ii],craftbenchy[iii],0,0.065,0.065)
                    end
                end
            end
            love.graphics.setColor(1,1,1)
            love.graphics.polygon("fill",55,295,70,265,85,295)
            love.graphics.polygon("fill",55,400,70,430,85,400)
            love.graphics.print(craftpage+1,60,325)
            for iii = 1,#craftbenchy do
                for ii =1,#craftbenchx do
                    if not (craftrecipe[ii+(#craftbenchx*(iii-1))+(craftpage*#craftbenchx*#craftbenchy)]==nil) then
                        love.graphics.draw(texture.gettex(craftrecipe[ii+(#craftbenchx*(iii-1))+(craftpage*#craftbenchx*#craftbenchy)].result.id),craftbenchx[ii],craftbenchy[iii],0,0.065,0.065)
                    end
                end
            end
            local cbsph = craftbenchsquareposhover
            for i = 1, #craftbenchy do
                for ii = 1,#craftbenchx do
                    if cbsph[ii+((i-1)*#craftbenchx)] == 0 then
                        if not (craftrecipe[(ii+(#craftbenchx*(i-1))+(craftpage*#craftbenchx*#craftbenchy))] == nil) then
                            local recipe = craftrecipe[(ii+(#craftbenchx*(i-1))+(craftpage*#craftbenchx*#craftbenchy))]
                            love.graphics.setColor(0,0,0,.85)   
                            local mx,my = mouse.getPos()
                            love.graphics.rectangle("fill",mx+5,my+5,260,75)
                            love.graphics.setColor(1,1,1)
                            love.graphics.print(lang.gettxt("item."..recipe.result.id),mx+10,my+10,0,.5)
                            for iii = 1,7 do
                                love.graphics.rectangle("fill",craftbenchx[iii]+mx-75,my+35,30,30)
                            end
                            for iii = 1,#recipe.ingrelist do        
                                love.graphics.draw(texture.gettex(recipe.ingrelist[iii]),craftbenchx[iii]+mx-75,my+35,0,0.065,0.065)    
                            end
                        end
                    end
                end
            end
        end
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill", 400,110,150,200)
        love.graphics.setColor(1,1,1)
        love.graphics.rectangle("fill", 405,265,40,40)
        love.graphics.rectangle("fill",455,275,20,20)
        love.graphics.polygon("fill",470,265,495,285,470,305)
        for x = 0,2 do
            for y = 0,2 do
                local hvr = crafterhover[(y*3)+x+1]
                love.graphics.setColor(hvr,hvr,hvr)
                love.graphics.rectangle("fill",405+x*50,115+y*50,40,40)
                love.graphics.setColor(1,1,1)
                if type(obj.list[i].nbt.inv[(y*3)+x+1])=="table" then
                    love.graphics.draw(texture.gettex(obj.list[i].nbt.inv[(y*3)+x+1].id),405+x*50,115+y*50,0,0.08)
                end
            end
        end
        local mx,my=mouse.getPos()
        local hvr = ((mx >= 505) and (mx <= 505+40) and (my >= 265) and (my <= 265+40)) and 0 or 1
        love.graphics.setColor(hvr,hvr,hvr)
        love.graphics.rectangle("fill",505,265,40,40)
        love.graphics.setColor(1,1,1)
        if type(obj.list[i].nbt.invslt2)=="table" then
            love.graphics.draw(texture.gettex(obj.list[i].nbt.invslt2.id),505,265,0,0.08,0.08)
        end
        local tpp = obj.list[i].nbt
        if tpp.recipe==nil then else
            love.graphics.draw(texture.gettex(tpp.recipe.result.id),405,265,0,0.08,0.08)
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
    end,
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
    end,
    put = function (z,x,y)
        local obb = obj.list[plr.craftopeni].nbt.inv
        local ob2 = plr.inventory[(y-1)*8+x]
        local ob3 = (y-1)*8+x
        print("crafttableput."..tostring(ob3))
        table.insert(obj.list[plr.craftopeni].nbt.inv,ob2)
        plr.inventory[ob3]={id=nil}
        local wao = {}
        for i = 1,#obb do
            if obb[i].id==nil then
                table.insert(wao,i)
            end
        end
        if not(#wao==0) then
            for i = 1,#wao do
                table.remove(obb,#wao-i+1)
            end
        end
     end
}
crafterhover={}