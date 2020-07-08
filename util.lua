

-- Shout/Serialized-Shout Function
tho.u.sh = function(thing)
    local thing = thing
    if(type(thing) ~= "string")then
       thing = minetest.serialize(thing)
    else end
    return minetest.chat_send_all(thing)
end
----------------------------------------------------


-- Serializing and Deserializing Wrappers
tho.u.se = function(thing)
return minetest.serialize(thing)
end

tho.u.dse = function(thing)
    return minetest.deserialize(thing)
    end
----------------------------------------------------


-- Error wrapper
    tho.u.err = function(message)
        local message = type(message) == "string" or tho.u.se(message)
        return minetest.log("error", message)
    end

----------------------------------------------------


-- Confirmation of player objref
tho.u.player = function(player)
    return player and type(player) == "string" and minetest.get_player_by_name(player) or player
end
----------------------------------------------------



-- Stat table

----------------------------------------------------
