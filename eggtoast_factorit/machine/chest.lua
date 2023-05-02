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
chest = {
    draw = function (i)
        if inv.open and (i==plr.craftopeni) and plr.craftopen and crafteruse then
            for y = 1,5 do
                for x = 1,6 do
                    love.graphics.setColor(1,1,1)
                    love.graphics.rectangle("fill",craftbenchx[x]+5,craftbenchy[y],30,30)
                    if not (obj.list[i].nbt.inv[(y-1)*6+x]==nil) then
                        love.graphics.draw(gr.texture.gettex(obj.list[i].nbt.inv[(y-1)*6+x].id),craftbenchx[x]+5,craftbenchy[y],0,0.065)
                    end
                end
            end
            love.graphics.print(lang.gettxt("item.chest.name"),60,223,0,1,1)
        end
    end,
    tick = function (i)
        if mouse.ison(1) and inv.open and (i==plr.craftopeni) then
            for y = 1,5 do
                for x = 1,6 do
                    local mx,my = mouse.getPos()
                    if (mx>craftbenchx[x]+5) and (mx<craftbenchx[x]+5+30) and (my>craftbenchy[y]) and (my<craftbenchy[y]+30) then
                        item.give(obj.list[i].nbt.inv[(y-1)*6+x])
                        obj.list[i].nbt.inv[(y-1)*6+x]={id=nil}
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
            print("craftoff "..i)
        else
            if plr.craftopen==false then
            obj.list[i].nbt.craftopen=true
            plr.craftopen=true
            crafteruse=true
            plr.craftopeni=i
            print("crafton "..i)
            end
        end
    end
}
chestput = function (z,x,y)
    for i = 1,#obj.list[plr.craftopeni].nbt.inv do
        if obj.list[plr.craftopeni].nbt.inv[i].id==nil then
            obj.list[plr.craftopeni].nbt.inv[i] = plr.inventory[(y-1)*8+x]
            plr.inventory[(y-1)*8+x]={id=nil}
            break
        end
    end
end