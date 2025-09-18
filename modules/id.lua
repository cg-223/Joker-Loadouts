function JKRLDTS.get_id(joker)
    assert(joker and joker.ability, "called with nil or no ability")
    if joker.ability.JKRLDTS_id then
        return joker.ability.JKRLDTS_id
    end
    G.GAME.JKRLDTS_id_inc = (G.GAME.JKRLDTS_id_inc or 0) + 1
    joker.ability.JKRLDTS_id = G.GAME.JKRLDTS_id_inc

    --safe from leaks, Card.remove hook cleans up
    G.loadouts_map[joker.ability.JKRLDTS_id] = joker
    return joker.ability.JKRLDTS_id
end

function JKRLDTS.jkr_from_id(id)
    return assert(G.loadouts_map[id], "Bad ID provided, did the relevant joker get removed?")
end

local old = G.start_run
function G.start_run(...)
    local ret = old(...)
    G.loadouts_map = {}

    for _, jkr in ipairs(G.jokers.cards) do
        if jkr.ability and jkr.ability.JKRLDTS_id then
            G.loadouts_map[jkr.ability.JKRLDTS_id] = jkr
        end
    end

    return ret
end