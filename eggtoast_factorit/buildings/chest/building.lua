local craftbenchy = {
    265,
    300,
    335,
    370,
    405
}
local craftbenchx = {
    55,
    90,
    125,
    160,
    195,
    230,
    265,
    300
}

local mouseclickcraft = false
chestlist = {}
chest = {
    loadsave= function ()
        chestlist={}
        for i = 1,#obj.list do
            if obj.list[i].id == "chestplcd" then
                chestlist[i]=obj.list[i].nbt.inv
            end
        end
    end,
    draw = function (i)
        if inv.open and (i==plr.craftopeni) and plr.craftopen and crafteruse then
            for y = 1,5 do
                for x = 1,6 do
                    love.graphics.setColor(1,1,1)
                    love.graphics.rectangle("fill",craftbenchx[x]+5,craftbenchy[y],30,30)
                    if not (chestlist[i][(y-1)*6+x]==nil) then
                        love.graphics.draw(texture.gettex(chestlist[i][(y-1)*6+x].id),craftbenchx[x]+5,craftbenchy[y],0,0.065)
                    end
                end
            end
            love.graphics.print(lang.gettxt("item.chest.name"),60,223,0,.5)
        end
    end,
    tick = function (i)
        if not (table.haskey(chestlist,i)) then
            chestlist[i]={}
        end
        if mouse.ison(1) then
            if inv.open and (i==plr.craftopeni) then
                if not mouseclickcraft then
                    for y = 1,5 do
                        for x = 1,6 do
                            local mx,my = mouse.getPos()
                            if (mx>craftbenchx[x]+5) and (mx<craftbenchx[x]+5+30) and (my>craftbenchy[y]) and (my<craftbenchy[y]+30) then
                                item.give(chestlist[i][(y-1)*6+x])
                                table.remove(chestlist[i],(y-1)*6+x)
                                break
                            end
                        end
                    end
                    mouseclickcraft=true
                end
            end 
        else
            mouseclickcraft=false
        end
        obj.list[i].nbt.inv=chestlist[i]
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
            crafteruse=true
            plr.craftopeni=i
            end
        end
    end,
    put = function (invid)
        if #chestlist[plr.craftopeni]~=30 then
            table.insert(chestlist[plr.craftopeni],plr.inventory[invid])
            plr.inventory[invid]={id=nil}
        end
    end
}