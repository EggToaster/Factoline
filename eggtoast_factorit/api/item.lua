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
    Has = function (tbl)
        local id = nil
        if tbl==nil then else
            for i = 1,#plr.inventory do
                if plr.inventory[i]==tbl then
                    return i
                end
            end
        end
        return nil
    end,
    hasAt = function (src,tbl)
        local id = nil
        if tbl==nil then else
            for i = 1,#src do
                if src[i]==tbl then
                    return i
                end
            end
        end
        return nil
    end,
    isHasAt = function (src,tbl)
        local id = false
        if tbl==nil then else
            for as = 1,#src do
                if src[as]==tbl then
                    return true
                end
            end
        end
        return nil
    end,
    getItemCount = function (src)
        local countingtemp=0
        if src==nil then
            return(0)
        else
            for i = 1,#src do
                if src[i].id==nil then else
                    countingtemp = countingtemp + 1
                end
            end
        end
        return(countingtemp)
    end,
    iHasAt = function (src,tbl,intt)
        intt = intt or 1
        for ads = intt,#src do
            if src[ads].id==tbl then
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