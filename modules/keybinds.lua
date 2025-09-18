local old = love.keypressed
function love.keypressed(key)
    local flag = false
    if tonumber(key) and G.jokers then
        flag = true
        if G.CONTROLLER.held_keys["v"] then
            JKRLDTS.load_loadout(tonumber(key))
        elseif G.CONTROLLER.held_keys["c"] then
            JKRLDTS.save_loadout(tonumber(key))
        else
            flag = false
        end
    end
    if not flag then
        old(key)
    end
end