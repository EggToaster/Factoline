craftbenchsquarepos = {
    {x=55,y=265},
    {x=55,y=300},
    {x=55,y=335},
    {x=55,y=370},
    {x=55,y=405}
}
craftbenchx = {
    125,
    160,
    195,
    230,
    265,
    300,
    335
}
craftbenchsquareposhover = {
    {hover=0},
    {hover=0},
    {hover=0},
    {hover=0},
    {hover=0}
}
craftpage=0
craftrecipe = {
    add = function (tables)
        table.insert(craftrecipe.list,tables,#craftrecipe.list-5)
    end,
    list = {
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
        {result=nil,ingrelist=nil},
        {result=nil,ingrelist=nil},
        {result=nil,ingrelist=nil},
        {result=nil,ingrelist=nil},
        {result=nil,ingrelist=nil}
    }
}
crafttabledown=false
function crtdrawrec()
    if #craftrecipe.list-(craftpage*5) < 1 then else
        for ii = 1,math.min(#craftrecipe.list-(craftpage*5),5) do
            if not (craftrecipe.list[ii+(craftpage*5)].result==nil) then
                love.graphics.draw(gr.texture.gettex(craftrecipe.list[ii+(craftpage*5)].result.id),craftbenchsquarepos[ii].x,craftbenchsquarepos[ii].y,0,0.065,0.065)
                for iii = 1,#craftrecipe.list[ii+(craftpage*5)].ingrelist do
                    love.graphics.draw(gr.texture.gettex(craftrecipe.list[ii+(craftpage*5)].ingrelist[iii]),craftbenchx[iii],craftbenchsquarepos[ii].y,0,0.065,0.065)
                end
            end
        end
    end
end
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
        if (craftpage+1)*5>=#craftrecipe.list then
            craftpage=craftpage-1
        end
    end,
    tick = function (i)
        if mouse.ison(1) then
            if (plr.craftopeni==i) then
                if not crafttabledown then
                    for ii = 1,#craftbenchsquareposhover do
                        if craftbenchsquareposhover[ii].hover==0 then
                            if not (craftrecipe.list[ii+(craftpage*5)].result==nil) then
                                local recip = craftrecipe.list[ii+(craftpage*5)]
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
                end
                crafttabledown = true
            end
        else
            if (plr.craftopeni == i) then
                crafttabledown = false
            end
        end
    end,
    draw = function (i)
        if inv.open == 1 then
        love.graphics.setColor(1,1,1)
        love.graphics.print(lang.gettxt("item.crafttable.name"),55,245,0,0.5,0.5)
        insqp=craftbenchsquarepos
        mx,my = mouse.getPos()
        for i = 1, #craftbenchsquarepos do
            if ((mx - insqp[i].x) > 0) and ((mx - insqp[i].x) <= 25) and ((my - insqp[i].y) > 0) and ((my - insqp[i].y) <= 25) then        
                craftbenchsquareposhover[i].hover=0
            else
                craftbenchsquareposhover[i].hover=1
            end
            gr.draw.square(craftbenchsquarepos[i].x,craftbenchsquarepos[i].y,30,30,"fill",craftbenchsquareposhover[i].hover,craftbenchsquareposhover[i].hover,craftbenchsquareposhover[i].hover)
            ai=i
            for i = 1,#craftbenchx do 
                gr.draw.square(craftbenchx[i],craftbenchsquarepos[ai].y,30,30,"fill",1,1,1)
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
            crafteruse=false
            plr.craftopeni=i
            print("crafton")
            end
        end
    end
}