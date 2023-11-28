craftbenchx = {
    90,
    125,
    160,
    195,
    230,
    265,
    300,
    335
}
craftbenchy = {
    265,
    300,
    335,
    370,
    405
}
craftbenchsquareposhover = {}
craftpage=0
craftrecipe = {
        {result={id="ironore"},ingrelist={"crafttable"}},
        {result={id="ironplate"},ingrelist={"ironore","ironore"}},
        {result={id="coppergear"},ingrelist={"copperplate"}},
        {result={id="irongear"},ingrelist={"ironplate"}},
        {result={id="copperplate"},ingrelist={"copperore","copperore"}},
        {result={id="axe"},ingrelist={"ironplate","coppergear"}},
        {result={id="crafter"},ingrelist={"irongear","ironplate","copperplate","coppergear","woodlog"}},
        {result={id="mecharm"},ingrelist={"circuitboard","irongear","irongear","copperwire"}},
        {result={id="copperwire"},ingrelist={"copperplate"}},
        {result={id="circuitboard"},ingrelist={"copperwire","ironplate","copperplate","woodlog"}},
        {result={id="chest"},ingrelist={"ironplate","ironplate","copperplate"}},
}
crafttabledown=false
crafttable={
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
                    local cbsph = craftbenchsquareposhover
                    for ii = 1,#cbsph do
                        if cbsph[ii] ==0 then 
                            if not (craftrecipe[ii+((#craftbenchx*#craftbenchy)*craftpage)] == nil) then
                                local recip = craftrecipe[ii+((#craftbenchx*#craftbenchy)*craftpage)]
                                local craftprep = {}
                                local craftprepid = {}
                                for iii = 1,#plr.inventory do
                                    if not (plr.inventory[iii].id==nil) then
                                        local tmp1 = plr.inventory[iii].id
                                        local itemsid = ""
                                        for i = 1,string.len(tmp1) do
                                            itemsid = itemsid..string.byte(tmp1,i)
                                        end
                                        if table.contains(craftprepid,itemsid) then
                                            craftprep[indexOf(craftprepid,itemsid)] = craftprep[indexOf(craftprepid,itemsid)] + 1
                                        else
                                            table.insert(craftprepid,itemsid)
                                            table.insert(craftprep,1)
                                        end
                                    end
                                end
                                local fail = false
                                for iii = 1,#recip.ingrelist do
                                    local itmid = ""
                                    local tmp1 = recip.ingrelist[iii]
                                    for i = 1,string.len(tmp1) do
                                        itmid = itmid..string.byte(tmp1,i)
                                    end
                                    if table.contains(craftprepid,itmid) then
                                        craftprep[indexOf(craftprepid,itmid)] = craftprep[indexOf(craftprepid,itmid)]-1
                                        if craftprep[indexOf(craftprepid,itmid)]==0 then
                                            table.remove(craftprep,indexOf(craftprepid,itmid))
                                            table.remove(craftprepid,indexOf(craftprepid,itmid))
                                        end
                                    else
                                        fail = true
                                    end
                                end
                                if not fail then
                                    for iii = 1,#recip.ingrelist do
                                        item.delete({id=recip.ingrelist[iii]})
                                    end
                                item.give(recip.result)
                                end
                            end
                        end
                    end
                    mx,my = mouse.getPos()
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
    end,
    draw = function(i)
        if inv.open == 1 then
            love.graphics.setColor(1,1,1)
            love.graphics.print(lang.gettxt("item.crafttable.name"),55,240,0,0.25,0.25)
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
    end,
    toggleopen = function(i)
        if obj.list[i].nbt.craftopen==true then
            obj.list[i].nbt.craftopen=false
            plr.craftopen=false
            crafteruse=false
            plr.craftopeni=nil
        else
            if plr.craftopen==false then
            obj.list[i].nbt.craftopen=true
            plr.craftopen=true
            crafteruse=false
            plr.craftopeni=i
            end
        end
    end
}