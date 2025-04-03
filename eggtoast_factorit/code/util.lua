-- Util utilities
local function nullcheck(x)
    if not x then return false end
    if x == {} then return false end
    if x == "" then return false end
    return true
end

-- Returns key of a value.
function table.keyof(t, v)
    for k, w in pairs(t) do
        if v == w then
            return k
        end
    end
    return nil
end

-- Returns index of a value.
function table.indexof(t, v)
    for i, _, w in ipairs(t) do
        if v == w then
            return i
        end
    end
    return nil
end

-- Returns index of a key.
function table.indexofkey(t,k)
    for i, l in ipairs(t) do
        if l == k then
            return i
        end
    end
end

-- Lists keys in table specified.
function table.keylist(t)
    local u = {}
    for k in pairs(t) do
        table.insert(u, k)
    end
    return u
end

-- Uppers all string in a table. No support for nested tables.
function table.upper(tt)
    local t = {}
    for k, v in pairs(tt) do
        if type(v) == "string" then
            t[k] = v:upper()
        end
    end
    return t
end

-- Deprecated. Use table.indexofkey instead.(Anything but nil and false will be true in if statements)
-- if table.indexofkey(table,keyname) then dosomething() end
function table.haskey(t,k)
    local keylist = table.keylist(t)
    if table.contains(keylist,k) then
        return true
    end
    return false
end

-- Deprecated. Use table.indexof instead.(Anything but nil and false will be true in if statements)
-- if table.indexof(table,object) then dosomething() end
function table.contains(t, e)
    for _, v in pairs(t) do
      if v == e then
        return true
      end
    end
    return false
end

-- How many <2nd argument> is in <1st argument>?
function table.count(t,e)
    local c = 0
    for _, v in pairs(t) do
        if v == e then
            c = c + 1
        end
    end
    return c
end

-- Merges two tables. If two of the same key exists, latter one will take the priority.
-- Supports nesting... I think
function table.merge(t,n)
    if (not nullcheck(t)) and (not nullcheck(n)) then
        return {}
    elseif not nullcheck(t) then
        return n
    elseif not nullcheck(n) then
        return t
    end

    for k, v in pairs(n) do
        local v = v
        if type(v) == "table" then
            v = table.clone(v)
        end
        t[k] = v
    end

    return t
end

-- If one element in left exists in right, returns true.
-- Useful for arguments.
-- e.g. {"-v","--verbose","-d","--debug","--dbg"} in left, arg in right
function table.hasleftinright(t,u)
    for _, v in pairs(t) do
        for _, w in pairs(u) do
            if v == w then
                return true
            end
        end
    end
    return false
end

-- Properly clones tree(table) in first argument, and returns it.
-- In another words, ProperTree!
-- Normally, if you use new = oldtable, it will clone table ID as well.
-- Because the ID is same, both table will have same contents. This never changes.
-- This will clone each individual elements, so you will never end up with conflicting table ID.
function table.clone(tbl)
    local t = {}
    for k, v in pairs(tbl) do
        local v = v
        if type(v) == "table" then
            v = table.clone(v)
        end
        t[k] = v
    end
    return t
end

--string

-- Basic split.
function string.split(str, spl)
    local t = {}
    for s in string.gmatch(str, "([^"..spl.."]+)") do
        table.insert(t,s)
    end
    return t
end

--Enough poisoning! Let's put it in a single class

local util = {}

-- Checks if x is null or empty kind of object
function util.nullcheck(x)
    return nullcheck(x)
end

-- 1~4th arguments is box(x,y, size-x, size-y), 5th and 6th is position of a dot.
-- If dot is in a box, returns true.
function util.boxcol(x,y,sx,sy,mx,my)
    local mx, my = (mx or nil), (my or nil)
    if (x < mx) and (y < my) and (mx < x+sx) and (my < y+sy) then
        return true
    end
    return false
end

-- DISABLED: UseNo I knintverparse
-- Parses version string to table.
-- Only supports 3, fully-integer coloums
-- For example: 1.5.23 => {"1", "5", "23"}
-- If version with characters that is not . is passed, it will... work
-- For example: 1.5.23-5 => {"1", "5", "23-5"}

--[[function util.verparse(ver)
    local t = {}
    for s in string.gmatch(ver, "([^.]+)") do
        table.insert(t,s)
    end
    return t
end]]

-- Version of verparse, but returns integer table.
-- Supports . and -.
-- Example: "5.8.9-3", {5, 8, 9, 3}

function util.intverparse(ver)
    local x = {}

    for s in string.gmatch(ver, "([^.]+)") do
        table.insert(x, s)
    end

    local t = {}
    for i = 1, #x do -- No I know what pairs is. Lua is just broken today.
        local v = tonumber(x[i])
        if v then
            table.insert(t, v)
        else
            for s in string.gmatch(x[i], "([^-]+)") do
                table.insert(t, s)
            end
        end
    end
    return t
end

-- Properly parses arguments
-- -rf will be r and f, --rf will be rf.
-- Meaning, -width will be w, i, d, t and h.
-- This should be --width ins    endtead, to return width.
-- --width 80 --height 50 = {width = 80, height = 50}
-- ACCEPTS STRING ONLY. No table.

function util.argparse(arg)
    local maybeadd = false
    local prev = ""
    local newargs = {}
    local values = {}
    for _, v in pairs(string.split(arg, " ")) do
        if string.sub(v, 1, 2) == "--" then -- Single argument
            if maybeadd then -- Tried to add already, adding the argument to list
                table.insert(newargs, prev)
            end
            maybeadd = true
            prev = string.sub(v, 3)
        elseif string.sub(v, 1, 1) == "-" then -- Few arguments?
            if string.len(v) == 2 then -- Just one.
                if maybeadd then
                    table.insert(newargs, prev)
                end
                maybeadd = true
                prev = string.sub(v, 2)
            else -- Few arguments
                for i = 2, string.len(v) do
                    table.insert(newargs, string.sub(v, i, i))
                end
            end
        else
            if maybeadd then -- Value of an argument
                newargs[prev] = v
                maybeadd = false
            else -- Just a value
                table.insert(values, v)
            end
        end
    end
    if maybeadd then -- Check to prevent last -- arg from being ignored
        table.insert(newargs, prev)
    end
    return newargs, values
end

return util