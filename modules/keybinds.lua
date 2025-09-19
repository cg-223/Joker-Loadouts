local old_kp = love.keypressed or function() end
function love.keypressed(key)
    local n = tonumber(key)
    --is key a number key between 1-4 and everything else is valid
    if n and not G.CONTROLLER.held_keys.lctrl and not G.CONTROLLER.held_keys.z and not G.CONTROLLER.held_keys.x and n >= 1 and n <= 4 and G.jkrldts_extra_buttons then
        JKRLDTS.button_handler(n, G.jkrldts_extra_buttons.UIRoot.children[n])
        G.jkrldts_extra_buttons.UIRoot.children[n]:juice_up(0.1, 0.1)
    --is key s or 5 and everything else is valid
    --commented for now since pressing other buttons autosaves anyways
    -- elseif key == "s" or (n == 5 and not G.CONTROLLER.held_keys.z and not G.CONTROLLER.held_keys.x) and not G.CONTROLLER.held_keys.lctrl and G.jkrldts_extra_buttons and G.GAME.current_loadout then
    --     JKRLDTS.save_loadout(G.GAME.current_loadout)
    end
    old_kp(key)
end