local game_start_run_ref = Game.start_run
function Game:start_run(args)
    game_start_run_ref(self, args)

    self.jkrldts_extra_buttons = UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                minw = 1,
                minh = 0.3,
                padding = 0.05,
                r = 0.1,
                colour = G.C.CLEAR
            },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        align = "tm",
                        minw = 0.5,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.RED,
                        shadow = true,
                        button = "jkrldts_btn_1",
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "1",
                                        scale = 0.35,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },
                {
                    n = G.UIT.C,
                    config = {
                        align = "tm",
                        minw = 0.5,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.RED,
                        shadow = true,
                        button = "jkrldts_btn_2",
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "2",
                                        scale = 0.35,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },
                {
                    n = G.UIT.C,
                    config = {
                        align = "tm",
                        minw = 0.5,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.RED,
                        shadow = true,
                        button = "jkrldts_btn_3",
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "3",
                                        scale = 0.35,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },
                {
                    n = G.UIT.C,
                    config = {
                        align = "tm",
                        minw = 0.5,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.RED,
                        shadow = true,
                        button = "jkrldts_btn_4",
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "4",
                                        scale = 0.35,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },
            }
        },
        config = {
            align = "tm",
            offset = { x = 0, y = 0 },
            major = G.ROOM_ATTACH,
            bond = 'Weak'
        }
    }
    G.GAME.current_loadout = G.GAME.current_loadout or 1
    self.jkrldts_extra_buttons.UIRoot.children[G.GAME.current_loadout].config.colour = G.C.GREEN
    self.HUD:recalculate()
end

function G.FUNCS.jkrldts_btn_1(e)
    JKRLDTS.button_handler(1, e)
end

function G.FUNCS.jkrldts_btn_2(e)
    JKRLDTS.button_handler(2, e)
end

function G.FUNCS.jkrldts_btn_3(e)
    JKRLDTS.button_handler(3, e)
end

function G.FUNCS.jkrldts_btn_4(e)
    JKRLDTS.button_handler(4, e)
end

function JKRLDTS.button_handler(num, e, dont_save)
    local old = G.GAME.current_loadout
    if old then
        if not dont_save then
            JKRLDTS.save_loadout(old)
        end
        e.parent.children[old].config.colour = G.C.RED
    end
    e.config.colour = G.C.GREEN
    G.GAME.current_loadout = num
    JKRLDTS.load_loadout(num)
end