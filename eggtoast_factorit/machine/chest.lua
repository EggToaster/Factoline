chest = {
    draw = function (i)
        if inv.open then
            
        end
    end,
    tick = function (i)
        
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