

-- EFFECT REGISTRATION
tho.f.register_effect = function(def)
    local effdef = {
        name = def.name,
        base_duration = def.base_duration,
        efftype = def.efftype,
        stackable = def.stackable,
        stack_mod = def.stack_mod,
        interval = def.interval,
        on_tick = def.on_tick,
    }

    tho.effects[effdef.name] = effdef
    return 
end
----------------------------


-- EFFECT REMOVAL
tho.f.effect_remove = function(playername, effectname)
    local playerindex = tho.affected[playername]
    local playereffect = playerindex and playerindex[effectname]
    tho.affected[playername][effectname] = playereffect and nil
end
----------------------------


-- EFFECT TICK DURATION DECREMENT
tho.f.effect_tick_down = function(playername, effectref, count)
    if tho.affected[playername][effectref] then
    local duration = tho.affected[playername][effectref].duration

    if duration > 0 then
    local count = type(count) == "number" and count or 1
    tho.affected[playername][effectref].duration = duration - count
    return tho.affected[playername][effectref].on_tick()
    else return  tho.f.effect_remove(playername, effectref)
    end
else end
end
----------------------------


-- EFFECT ASSIGNMENT
tho.f.assign_effect = function(playername, effectref, mods)
    local effect = tho.effects[effectref]
    local packet = {
        quant = mods and mods.quant or 1,
        duration = mods and mods.duration and effect.base_duration + mods.duration or effect.base_duration,
        interval = mods and mods.interval and effect.interval + mods.interval or effect.interval,
        on_tick = function() effect.on_tick(tho.u.player(playername)) end
    }
    if not tho.affected[playername] then tho.affected[playername] = {} else end
    tho.affected[playername][effectref] = packet
end
----------------------------


-- EFFECTSTEP REGISTRATION
tho.f.register_effstep = function()
    for k, v in pairs(tho.affected)do
        for j,u in pairs(v)do
        tho.f.effect_tick_down(k, j, 1)
        end
    end
end
----------------------------

local test = {
    name = "test",
    base_duration = 1000,
    efftype = "Stacking_neg",
    stackable = true,
    stack_mod = {},
    interval = 1,
    on_tick = function()
    tho.u.sh("TICK TEST DOES THING")
    end
}
tho.f.register_effect(test)
local test2 = {
    name = "test2",
    base_duration = 1000,
    efftype = "Stacking_neg",
    stackable = true,
    stack_mod = {},
    interval = 1,
    on_tick = function()
    tho.u.sh("GAAGAGAGAGAGAGAG")
    end
}
tho.f.register_effect(test2)
