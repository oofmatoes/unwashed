function splitString(s, separator)
    local result = {}
    for str in string.gmatch(s, "([^" .. separator .. "]+)") do
        table.insert(result, str)
    end
    return result
end

function countChar(s, char)
    local count = 0
    for v in s:gmatch(char) do
        count = count + 1
    end
    return count
end

function startsWith(s, check)
    return s:sub(1, #check) == check
end

function endsWith(s, check)
    return s:sub(#s - #check + 1) == check
end

function trim(s)
    return s:match("^%s*(.-)%s*$")
end

function replace(s, old, new)
    local result, i = s:gsub(old, new)
    return result
end

function extractNum(s)
    local numbers = {}
    for num in s:gmatch("%d+") do
        table.insert(numbers, tonumber(num))
    end
    return numbers
end
