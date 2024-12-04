local left,right = {},{}

for line in io.lines("input.txt") do
    local l, r = line:match("(%d+)%s+(%d+)")
    table.insert(left, l)
    table.insert(right,r)
end
local count = 0;

table.sort(left)
table.sort(right)

for i, v in pairs(left) do
     count = count+ math.abs(v - right[i])
end

print(count)

count = 0
for i, v in pairs(left) do
   for i2, v2 in pairs(right) do
        if v == v2 then
            count = count + v;
        end
   end
end

print(count)