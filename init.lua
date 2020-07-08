

modn = minetest.get_current_modname()
local path = minetest.get_modpath(modn)
tho = {u = {}, m = {},f = {}, players = {}, effects = {}, stats = {}}
tho.stats.order = {str = 1, dex = 2, def = 3, res = 4, pot = 5, pie = 6, spd = 7, ali = 8}

dofile(path.."/util.lua")
dofile(path.."/mgen.lua")
dofile(path.."/node.lua")
dofile(path.."/effects.lua")
dofile(path.."/commands.lua")
dofile(path.."/steps.lua")
dofile(path.."/stats.lua")