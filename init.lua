

modn = minetest.get_current_modname()
local path = minetest.get_modpath(modn)
tho = {u = {}, m = {},f = {}, players = {}, effects = {}, stats = {}}
dofile(path.."/util.lua")
dofile(path.."/mgen.lua")
dofile(path.."/node.lua")
dofile(path.."/effects.lua")
dofile(path.."/commands.lua")
dofile(path.."/steps.lua")
dofile(path.."/stats.lua")