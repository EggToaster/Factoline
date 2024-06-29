function keyOf(t, v)
    for k, v in pairs(t) do
        if v == v then
            return k
        end
    end
    return nil
end

function indexOf(t, vv)
    for i, v in ipairs(t) do
        if v == vv then
            return i
        end
    end
    return nil
end

--[[function  table.eachContain(array,varray)
    if ((array ~= nil) and (#array ~=0)) and ((varray ~= nil) and (#array ~= 0)) then
        for _, v in pairs(array) do
            for _,val in pairs(varray) do
                if v == val then
                return true
                end
            end
        end
    end
    return false
end]]

--[[function  table.indexOfEach(array,varray)
    for _, v in pairs(array) do
        for _,vv in pairs(varray) do
            if v == vv then
            return vv
            end
        end
    end
    return false
end]]

function table.keylist(tt)
    local t={}
    for k, _ in pairs(tt) do
        table.insert(t, k)
    end
    return t
end

function table.upper(tt)
    local t = {}
    for k, v in pairs(tt) do
        t[k] = v:upper()
    end
    return t
end

function table.haskey(t,k)
    local keylist = table.keylist(t)
    if table.contains(keylist,k) then
        return true
    end
    return false
end

function table.contains(t, e)
    for _, v in pairs(t) do
      if v == e then
        return true
      end
    end
    return false
end

function table.count(t,e)
    local c = 0
    for _, v in pairs(type) do
        if v == e then
            c = c + 1
        end
    end
    return c
end

function string.split(str, spl)
    local t = {}
    for s in string.gmatch(str, "([^"..spl.."]+)") do
        table.insert(t,s)
    end
    return t
end

function getdx()
    local dx, _ = love.graphics.getDimensions()
    return dx
end

function getdy()
    local _, dy = love.graphics.getDimensions()
    return dy
end

function nullcheck(x)
    if x == {} then return false end
    if x == nil then return false end
    if x == "" then return false end
    if x == 0 then return false end
    if x == false then return false end
    return true
end

function boxcol(x,y,sx,sy,mx,my)
    local mx, my = (mx or nil), (my or nil)
    if not nullcheck(mx) then
        mx,my = mouse.getPos()
    end
    if (x < mx) and (y < my) and (mx < x+sx) and (my < y+sy) then
        return true
    end
    return false
end