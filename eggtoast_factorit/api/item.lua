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
        local foundit=false
        local stopit=false
        for i = 1,#plr.inventory do
            if foundit then else if stopit then else
            if plr.inventory[i].id==nil then
                foundit=true
                id=i
        end
    end
end
    end
    if foundit then
        table.insert(plr.inventory,id,{id=nil,drag=0,hover=0})
        table.remove(plr.inventory,id+1)
    end
end
end
}