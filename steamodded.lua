JKRLDTS = SMODS.current_mod


JKRLDTS.default_config = {}

SMODS.load_mod_config(JKRLDTS)

JKRLDTS.config = JKRLDTS.config or {}

for i, v in pairs(JKRLDTS.default_config) do
    if not JKRLDTS.config[i] then
        JKRLDTS.config[1] = v
    end
end

SMODS.save_mod_config(JKRLDTS)


JKRLDTS.modules = {
    "config",
    "id",
    "loadouts",
    "ui",
    "keybinds"
}

for i, v in ipairs(JKRLDTS.modules) do
    assert(SMODS.load_file("modules/"..v..".lua"))()
end