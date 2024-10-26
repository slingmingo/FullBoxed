if (place_meeting(x, y, obj_player) && (!(ds_list_find_index(global.saveroom, id))))
    ds_list_add(global.saveroom, id)
if ds_list_find_index(global.saveroom, id)
    visited = 1
if (visited == 1 && sprite_index != spr_pepperdoor)
    sprite_index = spr_doorvisited
if (john && global.panic)
    sprite_index = spr_doorblocked
if (string_contains(room_get_name(room), "peptutorial") || string_contains(room_get_name(room), "medieval") || string_contains(room_get_name(room), "ruin"))
    sprite_index = spr_door_world1
else if (string_contains(room_get_name(room), "badland") || string_contains(room_get_name(room), "wasteyard") || string_contains(room_get_name(room), "farm") || string_contains(room_get_name(room), "saloon"))
    sprite_index = spr_door_world2
else if (string_contains(room_get_name(room), "cove") || string_contains(room_get_name(room), "forest") || string_contains(room_get_name(room), "space") || string_contains(room_get_name(room), "minigolf"))
    sprite_index = spr_door_world3
else if (string_contains(room_get_name(room), "street") || string_contains(room_get_name(room), "industrial") || string_contains(room_get_name(room), "freezer") || string_contains(room_get_name(room), "sewer"))
    sprite_index = spr_door_world4
if (string_contains(room_get_name(room), "chateau") || string_contains(room_get_name(room), "kidsparty") || string_contains(room_get_name(room), "war"))
    sprite_index = spr_door_world5
