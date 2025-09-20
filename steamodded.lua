assert(JKRLDTS, "Joker Loadouts is improperly nested. Ensure it is in a top-layer folder in your mods directory.")
---@diagnostic disable-next-line: param-type-mismatch
for i, v in pairs(JKRLDTS) do
    SMODS.current_mod[i] = v
end
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