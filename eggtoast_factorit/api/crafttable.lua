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
        table.insert(craftrecipe.list,tables)
    end,
    list = {
        {result={id="ironore",hover=1,drag=1},ingrelist={"crafttable"}},
        {result={id="ironplate",hover=1,drag=1},ingrelist={"ironore","ironore"}},
        {result={id="ironore",hover=1,drag=1},ingrelist={"crafttable"}},
        {result={id="ironore",hover=1,drag=1},ingrelist={"crafttable"}},
        {result={id="ironore",hover=1,drag=1},ingrelist={"crafttable"}}
    }
}
function crtdrawrec()
    cbsp = craftbenchsquarepos
    sca=craftpage*5
    if #craftrecipe.list-sca < 1 then else
    for aia = 1,math.min(#craftrecipe.list-sca,5) do
        love.graphics.draw(gr.texture.gettex(craftrecipe.list[aia+sca].result.id),craftbenchsquarepos[aia].x,craftbenchsquarepos[aia].y,0,0.065,0.065)
        for ii = 1,#craftrecipe.list[aia].ingrelist do
            love.graphics.draw(gr.texture.gettex(craftrecipe.list[aia].ingrelist[ii]),craftbenchx[ii],craftbenchsquarepos[aia].y,0,0.065,0.065)
        end
    end
end
end
craftbench={
    wheel = function ()
    end,
    tick = function (i)
        crtouch=true
        if love.mouse.isDown(1) then
            if mdcrafting then
            for aai = 1,#craftbenchsquareposhover do
                if craftbenchsquareposhover[aai].hover==0 then
                    if craftrecipe.list[aai+sca].result==nil then else
                        recip = craftrecipe.list[aai+sca]
                        craftprep = {}
                        craftprepid = {}
                        for lahee = 1,#plr.inventory do
                            if plr.inventory[lahee].id==nil then else
                                tmp1 = plr.inventory[lahee].id
                                itemsid = ""
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
                        fail = false
                        for aia = 1,#recip.ingrelist do
                            itmid = ""
                            tmp1 = recip.ingrelist[aia]
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
                        if fail then else
                            item.give(recip.result)
                        end
                    end
                end
            end
            end
        mdcrafting = false
    else
        mdcrafting = true
        end
    end,
    draw = function (i)
        if inv.open == 1 then
        love.graphics.print(lang.gettxt("item.crafttable.name"),55,245,0,0.5,0.5)
        insqp=craftbenchsquarepos
        mx,my = love.mouse.getPosition()
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
            plr.craftopeni=nil
            print("craftoff")
        else
            if plr.craftopen==false then
            obj.list[i].nbt.craftopen=true
            plr.craftopen=true
            plr.craftopeni=i
            print("crafton")
            end
        end
    end
}