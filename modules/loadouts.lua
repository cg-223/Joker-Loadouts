--validate a loadout for things like removed jokers
function JKRLDTS.validate_loadout(loadout)
    for pos = #loadout, 1, -1 do
        local id = loadout[pos]
        if (not G.loadouts_map[id]) or (not G.loadouts_map[id].area) or (G.loadouts_map[id].area ~= G.jokers) then
            table.remove(loadout, pos)
        end
    end
end

function JKRLDTS.init_loadouts()
    G.GAME.jkr_loadouts = G.GAME.jkr_loadouts or {}
end

function JKRLDTS.save_loadout(loadout_num)
    JKRLDTS.init_loadouts()
    G.GAME.jkr_loadouts[loadout_num] = {}
    local jkrs = G.jokers.cards
    for pos, jkr in ipairs(jkrs) do
        jkr:juice_up()
        G.GAME.jkr_loadouts[loadout_num][pos] = JKRLDTS.get_id(jkr)
    end
end

function JKRLDTS.load_loadout(loadout_num)
    JKRLDTS.init_loadouts()
    local loadout = G.GAME.jkr_loadouts[loadout_num] or {}
    JKRLDTS.validate_loadout(loadout)
    for pos, id in ipairs(loadout) do
        local target_jkr = JKRLDTS.jkr_from_id(id)
        local target_pos
        for pos_2, jkr in ipairs(G.jokers.cards) do
            if jkr == target_jkr then
                target_pos = pos_2
            end 
        end
        assert(target_pos, "couldn't find joker for loadout")
        local old = G.jokers.cards[pos]
        -- prevent cheating on amber acorn
        if old.facing == "front" and target_jkr.facing == "front" then
            if pos ~= target_pos then
                old:juice_up()
                target_jkr:juice_up()
            end
            G.jokers.cards[pos] = target_jkr
            G.jokers.cards[target_pos] = old
        end
    end

    G.jokers:set_ranks()
end

--cleanup id map
local old = Card.remove
function Card:remove(...)
    if self.ability and self.ability.JKRLDTS_id then
        G.loadouts_map[self.ability.JKRLDTS_id] = nil
    end
    return old(self, ...)
end