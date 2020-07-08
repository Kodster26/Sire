minetest.register_globalstep(function(dtime)
    local p = {minetest.get_connected_players(), {}}

    for n = 1, #p[1] do
    table.insert(p[2], p[1][n]:get_player_name())
    end
    tho.players = p[2]
end)



-----------------------
-- NON-STEP DEFAULTS --
-----------------------
minetest.register_on_joinplayer(function(player) 
    -- Inventory HUD adjustments
    player:hud_set_hotbar_itemcount(6)
    player:hud_set_hotbar_image("gui_hotbar.png")

    -- Inventory end blockers
    player:get_inventory():set_stack("main", 1, ItemStack({name = modn..":inv_blank_left", count = 1}))
    player:get_inventory():set_stack("main", 6, ItemStack({name = modn..":inv_blank_right", count = 1}))

    -- Initial class choice assignment
    tho.f.stat_assign(player, "init", {class_choice = "myrmidon"})
    tho.f.stat_set(player, "dex", tho.f.stat_get(player, "spd"))
end)


-----------------------