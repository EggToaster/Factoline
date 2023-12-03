item={
    give = function (tbl)
        if tbl==nil then else
            for x=1,#plr.inventory-1 do
                if plr.inventory[x].id==nil then
                    plr.inventory[x]=tbl
                    return(true)
                end
            end
        return(false)
        end
    end,
    isHas = function (tbl)
        if tbl==nil then else
            local id = nil
            for i = 1,#plr.inventory do
                    if plr.inventory[i].id==tbl then
                        id = true
                        break
                    end
            end
            return(id)
        end
    end,
    howMany = function (src,tbl)
        local countingtemp=0
        for i = 1,#src do
            if src[i]==tbl then else
                countingtemp = countingtemp + 1
            end
        end
        return(countingtemp)
    end,
    contains = function (src,tbl)
        for i = 1,#src do
            if src[i]==tbl then
                return(true)
            end
         end
        return(false)
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
            print("deleted "..tbl.id)
            return(true)
        else
            print("failed to delete item "..tbl.id)
        end
    end
    return false
    end,
    repl = function (src,tbl)
        if item.delete(src) then
            item.give(tbl)
        end
    end
}