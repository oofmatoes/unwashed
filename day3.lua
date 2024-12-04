local s1=0
for line in io.lines("input.txt") do
    for x,y in line:gmatch("mul%((%d+),(%d+)%)") do
        s1=s1+tonumber(x)*tonumber(y)
    end
end
print(s1)




local s2 = 0
local on = true
local i = 1
local s = io.open("input.txt"):read("*a")

while true do
    local ds, de = s:find("do%(%s*%)", i)
    local dns, dne = s:find("don't%(%s*%)", i)
    local ms, me, x, y = s:find("mul%(%s*(%d+)%s*,%s*(%d+)%s*%)", i)

    if not ds and not dns and not ms then 
        break 
    end

    if ds and (not dns or ds < dns) and (not ms or ds < ms) then
        on = true
        i = de + 1
    elseif dns and (not ds or dns < ds) and (not ms or dns < ms) then
        on = false
        i = dne + 1
    elseif ms and (not ds or ms < ds) and (not dns or ms < dns) then
        if on then
            s2 = s2 + tonumber(x) * tonumber(y)
        end
        i = me + 1
    else
        i = i + 1
    end
end

print(s2)