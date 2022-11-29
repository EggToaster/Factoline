isString = function (arg)
    if type(arg)=="string" then
        return true
    end
    return false
end
isInt = function (arg)
    if type(arg)=="number" then
        return true
    end
    return false
end
isNil = function (arg)
    if type(arg)=="nil" then
        return true
    end
    return false
end
isBool = function (arg)
    if type(arg)=="boolean" then
        return true
    end
    return false
end
isFunction = function (arg)
    if type(arg)=="function" then
        return true
    end
    return false
end
isTable = function (arg)
    if type(arg)=="table" then
        return true
    end
    return false
end
function table.len(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end
function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
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