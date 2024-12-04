local grid = {}
local count = 0

for line in io.lines("input.txt") do
    local row = {}
    for char in line:gmatch(".") do
        table.insert(row, char)
    end
    table.insert(grid, row)
end

local nr = #grid
local nc = #grid[1]

for i, v in pairs(grid) do
    for i2, v2 in pairs(v) do
        if v2 == 'X' and i2 + 3 <= nc then
            if v[i2 + 1] == 'M' and v[i2 + 2] == 'A' and v[i2 + 3] == 'S' then
                count = count + 1
            end
        end
    end
end

for i, v in pairs(grid) do
    for i2, v2 in pairs(v) do
        if v2 == 'X' and i2 - 3 >= 1 then
            if v[i2 - 1] == 'M' and v[i2 - 2] == 'A' and v[i2 - 3] == 'S' then
                count = count + 1
            end
        end
    end
end

for i, v in pairs(grid) do
    for i2, v2 in pairs(v) do
        if v2 == 'X' and i + 3 <= nr then
            if grid[i + 1][i2] == 'M' and grid[i + 2][i2] == 'A' and grid[i + 3][i2] == 'S' then
                count = count + 1
            end
        end
    end
end

for i, v in pairs(grid) do
    for i2, v2 in pairs(v) do
        if v2 == 'X' and i - 3 >= 1 then
            if grid[i - 1][i2] == 'M' and grid[i - 2][i2] == 'A' and grid[i - 3][i2] == 'S' then
                count = count + 1
            end
        end
    end
end

for i, v in pairs(grid) do
    for i2, v2 in pairs(v) do
        if v2 == 'X' and i + 3 <= nr and i2 + 3 <= nc then
            if grid[i + 1][i2 + 1] == 'M' and grid[i + 2][i2 + 2] == 'A' and grid[i + 3][i2 + 3] == 'S' then
                count = count + 1
            end
        end
    end
end

for i, v in pairs(grid) do
    for i2, v2 in pairs(v) do
        if v2 == 'X' and i - 3 >= 1 and i2 - 3 >= 1 then
            if grid[i - 1][i2 - 1] == 'M' and grid[i - 2][i2 - 2] == 'A' and grid[i - 3][i2 - 3] == 'S' then
                count = count + 1
            end
        end
    end
end

for i, v in pairs(grid) do
    for i2, v2 in pairs(v) do
        if v2 == 'X' and i + 3 <= nr and i2 - 3 >= 1 then
            if grid[i + 1][i2 - 1] == 'M' and grid[i + 2][i2 - 2] == 'A' and grid[i + 3][i2 - 3] == 'S' then
                count = count + 1
            end
        end
    end
end

for i, v in pairs(grid) do
    for i2, v2 in pairs(v) do
        if v2 == 'X' and i - 3 >= 1 and i2 + 3 <= nc then
            if grid[i - 1][i2 + 1] == 'M' and grid[i - 2][i2 + 2] == 'A' and grid[i - 3][i2 + 3] == 'S' then
                count = count + 1
            end
        end
    end
end

print(count)


count = 0



for i, v in pairs(grid) do
    for i2, v2 in pairs(v) do
        if v2 == 'A' then
            if i - 1 >= 1 and i2 - 1 >= 1 and i + 1 <= nr and i2 + 1 <= nc then
                if (grid[i - 1][i2 - 1] == 'M' and grid[i + 1][i2 + 1] == 'S') or 
                   (grid[i - 1][i2 - 1] == 'S' and grid[i + 1][i2 + 1] == 'M') then
                    if (grid[i - 1][i2 + 1] == 'M' and grid[i + 1][i2 - 1] == 'S') or 
                       (grid[i - 1][i2 + 1] == 'S' and grid[i + 1][i2 - 1] == 'M') then
                        count = count + 1
                    end
                end
            end
        end
    end
end

print(count)


--unga bunga