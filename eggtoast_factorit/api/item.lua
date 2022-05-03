item={
    give = function (tbl)
        if tbl==nil then else
              for x=1,#plr.inventory-1 do
                if plr.inventory[x].id==nil then
                    plr.inventory[x]=tbl
                  break
              end
            end
            --local foundit=false
           -- local stopit=false
           -- for i = 1,#plr.inventory do
            --    if foundit then else if stopit then else
           --     if plr.inventory[i].id==nil then
          --          foundit=true
         --           idzzz=i
         --   end
     --   end
 --   end
      --  end
     --   if foundit then
    --        plr.inventory[idzzz]=tbl
      --  end
    end
end,
isHas = function (tbl)
    if tbl==nil then else
        local foundit = false
        local stopit = false
        local id = false
        for i = 1,#plr.inventory do
            if foundit then else if stopit then else
                if plr.inventory[i].id==tbl then
                    foundit = true
                    id = true
                end
            end
        end
        end
        return(id)
    end
end,
delete = function (tbl)
    if tbl==nil then else
        print("attemping to delete item "..tbl.id)
        local foundit=false
        local stopit=false
        for i = 1,#plr.inventory do
            if foundit then else if stopit then else
            if plr.inventory[i].id==tbl.id then
                foundit=true
                idss=i
        end
    end
end
    end
    if foundit then
        table.insert(plr.inventory,idss,{id=nil})
        table.remove(plr.inventory,idss+1)
        print("deleted "..tbl.id.." returning true")
        return(true)
    else
        print("failed to delete item "..tbl.id.." err.notfoundtarget returning false")
    end
end
return(false)
end
}