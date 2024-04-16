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
function table.alltrue(t)
    fail = false
   for i = 1,#t do
    if t[i]==false then
        fail=true
        break
    end
   end
   if fail==false then
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