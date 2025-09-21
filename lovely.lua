JKRLDTS = {}
local fs = love.filesystem


local function find_jkrldts()
    local start_dir = "Mods"
    local files = fs.getDirectoryItems(start_dir)
    for _, file in ipairs(files) do
        if fs.getInfo(start_dir.."/"..file.."/".."JKRLDTS_MARKER") then
            return start_dir.."/"..file.."/"
        end
    end
end

JKRLDTS.modules = {
    "config",
    "id",
    "loadouts",
    "ui",
    "keybinds"
}

local mod_path = find_jkrldts()

for i, v in ipairs(JKRLDTS.modules) do
---@diagnostic disable-next-line: param-type-mismatch
    load(fs.read(mod_path.."modules/"..v..".lua"))()
end