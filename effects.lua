


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

tho.f.effect_tick_down = function(playername, effectref, count)
    local duration = tho.affected[playername][effectref].duration
    local count = type(count) == "number" and count or 1
    tho.affected[playername][effectref].duration = duration - count
    return tho.affected[playername][effectref].on_tick()
end

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

tho.f.register_effstep = function()
    for k, v in pairs(tho.affected)do
        for j,u in pairs(v)do
        tho.f.effect_tick_down(k, j)
        end
    end
end

local test = {
    name = "test",
    base_duration = 10,
    efftype = "Stacking_neg",
    stackable = true,
    stack_mod = {},
    interval = 1,
    on_tick = function()
    tho.u.sh("TICK TEST DOES THING")
    end
}
tho.f.register_effect(test)

