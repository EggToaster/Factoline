function keyOf(tbl, value)
    for k, v in pairs(tbl) do
        if v == value then
            return k
        end
    end
    return nil
end
function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end
function  table.eachContain(array,varray)
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
end
function  table.indexOfEach(array,varray)
    for _, v in pairs(array) do
        for _,val in pairs(varray) do
            if v == val then
            return val
            end
        end
    end
    return false
end
function table.keylist(t)
    local keys={}
    for key,_ in pairs(t) do
        table.insert(keys, key)
    end
    return keys
end
function table.sortStr(t)
    tkeys = table.sort(t, function(a, b) return string.upper(a) < string.upper(b) end)
    return tkeys
end
function table.upper(t)
    local upped = {}
    for i = 1,#t do
        table.insert(upped,t[i]:upper())
    end
    return upped
end
function table.compair(a,b)
    local temp = false
    for i = 1, math.min(#a,#b) do
        if a[i] < b[i] then
            temp=true
            break
        end
    end
    return temp
end
function table.haskey(t,k)
    local keylist = table.keylist(t)
    if table.contains(keylist,k) then
        return true
    end
    return false
end
function table.contains(table, element)
    for _, value in pairs(table) do
      if value == element then
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
    local dx,dy = love.graphics.getDimensions()
    return dx
end
function getdy()
    local dx,dy = love.graphics.getDimensions()
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
    local mx,my = mx,my
    if not nullcheck(mx) then
        mx,my = mouse.getPos()
    end
    if (x < mx) and (y < my) and (mx < x+sx) and (my < y+sy) then
        return true
    end
    return false
end