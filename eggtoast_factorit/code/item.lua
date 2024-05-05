item={
    give = function (tbl)
        for x=1,#plr.inventory-1 do
            if plr.inventory[x].id==nil then
                plr.inventory[x]=tbl
                return(true)
            end
        end
        return false
    end,
    count = function (tbl)
        local tmp = 0
        for _,v in pairs(plr.inventory) do
            if v == tbl then
                tmp = tmp + 1
            end
        end
        return tmp
    end,
    contains = function (id)
        for _, v in pairs(plr.inventory) do
            if v.id==id then
                return true
            end
         end
        return false
    end,
    delete = function (tbl)
        for i, _, v in ipairs(plr.inventory) do
            if tbl == v then
                plr.inventory[i] = {id=nil}
                return true
            end
        end
        return false
    end,
    deletefew = function (t)
        local inv = plr.inventory
        for _, v in pairs(inv) do
            for ii, _, k in ipairs(t) do
                if v == k then
                    inv[indexOf(inv,v)] = {id=nil}
                    table.remove(t,ii)
                    break
                end
            end
            if not nullcheck(t) then
                plr.inventory = inv
                return true
            end
        end
        return false
    end,
    repl = function (src,tbl)
        if item.delete(src) then
            item.give(tbl)
            return true
        end
        return false
    end
}