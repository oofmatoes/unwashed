require("strM")
local count = 0

function safe(input)
    for i, v in pairs(input) do input[i] = tonumber(v) end

    local function check(seq)
        local rise = seq[1] < seq[2]
        for i, v in pairs(seq) do
            if i > 1 and ((rise and v <= seq[i - 1]) or (not rise and v >= seq[i - 1]) or math.abs(v - seq[i - 1]) > 3) then
                return false
            end
        end
        return true
    end

    if check(input) then 
        return true 
    end

    for i, v in pairs(input) do
        local clone = {}
        for i2, v2 in pairs(input) do
            if i2 ~= i then 
                clone[#clone + 1] = v2 
            end
        end
        if check(clone) then 
            return true 
        end
    end

    return false
end

for line in io.lines("input.txt") do
    if safe(splitString(line, " ")) then count = count + 1 end
end

print(count)