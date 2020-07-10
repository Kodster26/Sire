
-- DEBUG COMMANDS ONLY IN HERE FOR NOW
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

minetest.register_chatcommand("mydex", {
    privs = {
        interact = true,
    },
    func = function(name, param)
        local player = tho.u.player(name)
        tho.u.sh(tho.f.stat_get(player, "dex"))
    
        return true
    end,
})

minetest.register_chatcommand("myeffects", {
    privs = {
        interact = true,
    },
    func = function(name, param)
        
        tho.u.sh(dump(tho.affected))
    
        return true
    end,
})
minetest.register_chatcommand("effects", {
    privs = {
        interact = true,
    },
    func = function(name, param)
        
        tho.u.sh(dump(tho.effects))
    
        return true
    end,
})