--So there are a handful of functions that I'm using in a lot of places
--So rather than continue to copy across the same handful of functions to every single new module
--I'm just going to unify them here
--Here's how you use this:
-- 1. When you're making a new module, add this near the top:
--        local Shared = require( "Module:Shared" )
-- 2. When you need to make a call to one of these functions,
--    just preface it with "Shared."
--    So for example you could call tableCount like so:
--        Shared.tableCount(data)
--This is being initially pulled together by User:Falterfire, but...
--not all these functions are mine.
--I've cited original author where I can trace it

local p = {}

-- iterator sorted by keys
-- For example, if you had a table that looked something like
-- data = {["Cat"] = 5,
--         ["Bat"] = 4,
--         ["Hat"] = 7}
-- You could do
--  for k, v in skpairs(data) do...
-- And your loop would start with k="Bat", v=4 then go to k="Cat", v=5, 
--         and finally to k="Hat", v=7
--Originally snagged this from Module:VoidByReward written by User:NoBrainz
function p.skpairs(t, revert)
    local keys = {}
    for k in pairs(t) do keys[#keys + 1] = k end
    if revert ~= nil then
        table.sort(keys, function(a, b) return a > b end)
    else
        table.sort(keys)
    end

    local i = 0
    local iterator = function()
        i = i + 1
        local key = keys[i]
        if key then
            return key, t[key]
        else
            return nil
        end
    end
    return iterator
end

--Loops through all the Relic types
--Comes up a surprising amount
function p.relicLoop()
    local tier = ""
    local iterator = function()
            if(tier == "") then
                tier = "Lith"
            elseif (tier == "Lith") then
                tier = "Meso"
            elseif(tier == "Meso") then
                tier = "Neo"
            elseif(tier =="Neo") then
                tier = "Axi"
            else
                tier = nil
            end
            
            return tier
        end
    return iterator
end

function p.consoleLoop()
    local console = ""
    local iterator = function()
            if(console == "") then
                console = "PC"
            elseif (console == "PC") then
                console = "PS4"
            elseif(console == "PS4") then
                console = "XB1"
            else
                console = nil
            end
            
            return console
        end
    return iterator
end
 
-- conveniently shifts BLAH to Blah
-- Handy when formatting data in ALL CAPS or all lower case
--Originally snagged this from Module:VoidByReward written by User:NoBrainz
function p.titleCase(head, tail)
    if tail == nil then
        --Split into two lines because don't want the other return from gsub
        local result = string.gsub(head, "(%a)([%w_']*)", p.titleCase)
        return result
    else
        return string.upper(head) .. string.lower(tail)
    end
end

-- Returns the number of rows in a table
-- Originally snagged this from Module:VoidByReward written by User:NoBrainz
-- Note from User:Cephalon Scientia:
--      Length operator (#) doesn't work as expected for tables that have been
--      loaded into a module by mw.loadData().
--      Use this function to get all the rows in a table regardless of them
--      being keys, values, or tables
-- pre : table is a table with no explicit nil values
-- post: returns the size of table, ignoring keys with nil values and 
--       nil values themselves
--       if table is not of type 'table' then return nil
function p.tableCount(table)
    if (type(table) == 'table') then
        local count = 0
        for _ in pairs(table) do count = count + 1 end
        return count
    else
        return nil
    end
end

-- Returns the number of indexed elements in a table
-- pre : table is a table with no explicit nil values
-- post: returns the number of indexed elements in a table
--       if table is not of type 'table' then return nil
function p.indexCount(table)
    if (type(table) == 'table') then
        local count = 0
        for _ in ipairs(table) do count = count + 1 end
        return count
    else
        return nil
    end
end

--Sorts theTable based on the listed column
function p.tableSort(theTable, sortCol, ascend)
    local new   function sorter(r1, r2)
                    if(ascend) then
                        return r1[sortCol] < r2[sortCol]
                    else
                        return r1[sortCol] > r2[sortCol]
                    end
                end
    table.sort(theTable, sorter)
end

--Splits a string based on a sent in separating character
--For example calling splitString ("Lith V1 Relic", " ") would return {"Lith", "V1", "Relic"}
function p.splitString(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

--Returns 'true' if a string starts with something
--For example calling startsWith ("Lith V1 Relic", "Lith") would return true
function p.startsWith(string1, start)
    return string.sub(string1, 1, string.len(start)) == start
end

--Stolen from Stack Overflow
--Adds commas
function p.formatnum(number)
  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')

  -- reverse the int-string and append a comma to all blocks of 3 digits
  int = int:reverse():gsub("(%d%d%d)", "%1,")

  -- reverse the int-string back remove an optional comma and put the 
  -- optional minus and fractional part back
  return minus .. int:reverse():gsub("^,", "") .. fraction
end

function p.round(val, maxDigits, minDigits)
    if(val == nil) then
        return nil
    else
        if(type(maxDigits) == "table") then
            minDigits = maxDigits[2]
            maxDigits = maxDigits[1]
        end
        
        local result = val..""
        local decimals = string.find(result, "%.")
        if(decimals ~= nil ) then decimals = string.len(result) - decimals else decimals = 0 end

        if(maxDigits ~= nil and decimals > maxDigits) then
            result = tonumber(string.format("%."..maxDigits.."f", result))
        elseif(minDigits ~= nil and decimals < minDigits) then
            result = string.format("%."..minDigits.."f", result)
        end
        
        return result
    end
end

-- pre : List is a table or a string
--       Item is the element that is being searched
--       IgnoreCase is a boolean; if false, search is case-sensitive
-- post: returns a boolean; true if element exists in List, false otherwise
function p.contains(List, Item, IgnoreCase)
    if (List == nil or Item == nil) then 
        return false 
    end
    if(IgnoreCase == nil) then 
        IgnoreCase = false 
    end
    
    if(type(List) == "table") then
        for key, value in pairs(List) do
            if (value == Item) then
                return true
            elseif (IgnoreCase and string.upper(value) == string.upper(Item)) then
                return true
            end
        end
    else
        local start = string.find(List, Item)
        return start ~= nil
    end
    return false
end

--Stolen from http://lua-users.org/wiki/StringTrim
--Trims whitespace. Not quite sure how it works.
function p.trim(str)
  return (str:gsub("^%s*(.-)%s*$", "%1"))
end

-- generic function that checks to see if a key exists in a given nested table
-- added by User:Cephalon Scientia
-- pre : table is a nested table
--       key is a string that represents a key name
--       length is a integer that represents the size of outer table; 
--       if omitted, length is set to size of outer table
-- post: returns a boolean; true if key exists in table, false otherwise or
--       if key contains a nil value
function p.hasKey(table, key, length)
    if (length == nil) then
        length = p.tableCount(table)
    end
    
    -- iterating through outer table
    for i = 1, length, 1 do
        local elem = table[i]   -- storing one of inner tables into a variable
        if (elem[key] ~= nil) then
            return true
        end
    end
    return false
end

-- copies the contents of a variable; for copying tables recursively
-- source: http://lua-users.org/wiki/CopyTable
-- pre : orig is the original value
-- post: returns a copy of the original table if orig is of type
--       table, including all children tables but not metatables; 
--       otherwise returns whatever is contained in orig
function p.deepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[p.deepCopy(orig_key)] = p.deepCopy(orig_value)
        end
        -- cannot copy metatables of tables loaded in by mw.loadData();
        -- stack overflow error if you uncomment the statement below
        -- setmetatable(copy, p.deepCopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

return p

