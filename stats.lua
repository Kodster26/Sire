tho.stats.base = {
    -- Stats order: STR, DEX, DEF, RES, POT, PIE, SPD, ALI,
    classes = {
        none = {2,2,2,2,2,2,2,100},
        knight = {8,3,6,4,2,1,120,0},
        cleric = {3,4,3,6,4,8,140,0},
        rogue = {4,8,4,4,2,1,170,0},
        myrmidon = {7,6,5,5,4,4,160,0},
        explorer = {6,6,5,5,3,2,150,0},
        artificier = {5,4,4,6,7,1,130,0},
        sage = {3,4,3,6,8,3,140,0}
    }}

-- STAT ASSIGNMENT

tho.f.stat_assign = function(player, reason, init) -- Mainly for initial assignments, but can be used to abruptly reassign stats
    
    local player = tho.u.player(player)
    if not player then return end
    
    local old_stats = player:get_properties()

    if reason == "init" then -- For new players, <init> should be the results of player selection. Sets default stat values.
    local class = init and init.class_choice or "none"
    local class_stats = init and init.class_choice and tho.stats.base.classes[class]
    old_stats.infotext = tho.u.se({class = class, stats = class_stats})
    else end

    local new_stats = old_stats
    return player:set_properties(new_stats)
end
-----------------

-- Utility functions
tho.stats.order = {str = 1, dex = 2, def = 3, res = 4, pot = 5, pie = 6, spd = 7, ali = 8}

tho.f.stat_cycle = function(player)
end

-- STAT ALTERING

tho.f.stat_alter = function(player, stat, value)
    local stat = tho.stats.order[stat]
    local player = player
    local props = player:get_properties()
    local pstats = tho.u.dse(props.infotext)
    pstats.stats[stat] = value and type(value) == type(pstats.stats[stat]) and value or tho.u.err("Stat alter value error!")
    props.infotext = tho.u.se(pstats)
    return player:set_properties(props)
end