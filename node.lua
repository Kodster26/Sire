minetest.register_node(modn..":tile",{
    description = "Caliper",
    paramtype = "light",
    tiles = {"testile_brown.png"},
    groups = {crumbly = 1},
    on_destruct = function(pos)
        local belowpos = pos
        local bc = {x = pos.x + 12, y = pos.y + 12, z = pos.z + 12}
        local vm = minetest.get_voxel_manip(pos,bc)
        local vmin, vmax = vm:read_from_map(pos, bc)
        local vmdata = vm:get_data()
        local va = VoxelArea:new{MinEdge,MaxEdge = vmin,vmax}
        tho.u.sh(va:getExtent())
        tho.u.sh(va:getVolume())
        tho.u.sh("Number of vmdata is "..#vmdata)
        tho.u.sh("vm:get_emerged_area says: "..minetest.serialize(vm:get_emerged_area()))
        tho.u.sh("vm min and max coords says: ".. minetest.serialize({vmin,vmax}))
        
        for n = 1, #vmdata do
        vmdata[n] = minetest.get_content_id(modn..":tile3")
        end
        vmdata[1] = minetest.get_content_id(modn..":tile")
        --vmdata[2049] = minetest.get_content_id(modn..":air2")
        vmdata[#vmdata] = minetest.get_content_id(modn..":tile2")
        --vmdata[1+(va:getExtent().x*va:getExtent().y)] = minetest.get_content_id(modn..":air")
        local p = va:getExtent()
        --tho.u.sh(p)
        --tho.u.sh(va:getVolume())
        local ind = 16
        local ex = 512
        if(#vmdata >= 16384)then
            ind, ex = 32, 1024
        else end
        for n = 1, #vmdata/ind do
                vmdata[(n*ex)+ 1] = minetest.get_content_id(modn..":air2")

        end
        vm:set_data(vmdata)
        vm:write_to_map(true)--tho.u.sh(idx)
    end,

})
minetest.register_node(modn..":tile2",{
    description = "Caliper",
    paramtype = "light",
    tiles = {"tile2.png"},
    groups = {crumbly = 1},
    on_punch = function(pos)
    end,
    light_source = 12
})


minetest.register_node(modn..":tile3",{
    description = "Caliper",
    paramtype = "light",
    tiles = {"bricks1_argent.png"},
    groups = {crumbly = 1},
    on_punch = function(pos)
        local bc = {x = pos.x + 12, y = pos.y + 12, z = pos.z + 12}
        local vm = minetest.get_voxel_manip(pos,{x = pos.x + 12, y = pos.y + 12, z = pos.z + 12})
        local vmin, vmax = vm:read_from_map(pos, bc)
        local vmdata = vm:get_data()
        local va = VoxelArea:new{MinEdge,MaxEdge = vmin,vmax}

    end,
})
minetest.register_node(modn..":tile3g",{
    description = "Caliper",
    paramtype = "light",
    tiles = {"bricks1_argent.png^(tile_overlay_growth1.png^[invert:r)"},
    groups = {crumbly = 1},
    on_punch = function(pos)
        local bc = {x = pos.x + 12, y = pos.y + 12, z = pos.z + 12}
        local vm = minetest.get_voxel_manip(pos,{x = pos.x + 12, y = pos.y + 12, z = pos.z + 12})
        local vmin, vmax = vm:read_from_map(pos, bc)
        local vmdata = vm:get_data()
        local va = VoxelArea:new{MinEdge,MaxEdge = vmin,vmax}

    end,
})

minetest.register_node(modn..":air",{
    description = "Caliper",
    drawtype = "airlike",
    paramtype = "light",
    --pointable = false,
    walkable = false,
    color = "0xFFFFFFFF",
    post_effect_color = {a = 200, r = 100, g = 50, b = 12},
    groups = {crumbly = 1},
    light_source = 4
})

minetest.register_node(modn..":air2",{
    description = "Caliper",
    drawtype = "airlike",
    paramtype = "light",
    --pointable = false,
    walkable = false,
    color = "0xFFFFFFFF",
    post_effect_color = {a = 200, r = 200, g = 120, b = 12},
    groups = {crumbly = 1},
    light_source = 4,
    on_punch = function(pos, node, puncher)
    tho.f.stat_alter(puncher, "spd", 999)
    
    end
})
minetest.register_node(modn..":tile4",{
    description = "Caliper",
    paramtype = "light",
    tiles = {"tile1.png"},
    groups = {crumbly = 1},
    on_punch = function(pos)
    end,
    light_source = 12,
    on_use = function(itemstack, user, pointed_thing)
        local pos = user:get_pos()
        pos.y = pos.y + 3
    local des = Raycast(pos, vector.multiply(pos, 2), true, false):next().under
    
    return des and minetest.set_node(des, {name = modn..":tile4"})
    end
})
minetest.register_craftitem(modn..":inv_blank_left",{
    description = "",
    inventory_image = "item_blank.png^[opacity:0",
   
    groups = {pseudo = 1},
    on_drop = function()
    return nil
    end
})
minetest.register_craftitem(modn..":inv_blank_right",{
    description = "",
    inventory_image = "item_blank.png^[opacity:0",
    groups = {pseudo = 1},
    on_drop = function()
    return nil
    end
})
minetest.register_node(modn..":mjonlr",{
    description = "mjonlr",
    drawtype = "mesh",
    mesh = "untitled.obj",
    wield_image = "untitled.obj",
    paramtype = "light",
    --pointable = false,
    walkable = false,
    color = "0xFFFFFFFF",
    post_effect_color = {a = 200, r = 100, g = 50, b = 12},
    groups = {crumbly = 1},
    light_source = 4
})