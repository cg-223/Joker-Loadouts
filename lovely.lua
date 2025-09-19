JKRLDTS = {}
local NFS = NFS
if not NFS then
    local succ, ret = pcall(require, "nativefs")
    if succ then
        NFS = ret
    else
        NFS = love.filesystem
    end
end


local function find_jkrldts()
    local start_dir = "Mods"
    local files = NFS.getDirectoryItems(start_dir)
    for _, file in ipairs(files) do
        if NFS.getInfo(start_dir.."/"..file.."/".."JKRLDTS_MARKER") then
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
    load(NFS.read(mod_path.."modules/"..v..".lua"))()
end