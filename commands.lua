minetest.register_chatcommand("players", {
    privs = {
        interact = true,
    },
    func = function(name, param)
    tho.u.sh(tho.players)
    
        return true
    end,
})


minetest.register_chatcommand("mystats", {
    privs = {
        interact = true,
    },
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
    tho.u.sh(player:get_properties().infotext)
    
        return true
    end,
})