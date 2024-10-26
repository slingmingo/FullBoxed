x += (11 * image_xscale)
if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_stomp_shockwave)
    sprite_index = spr_cheesedragon_stomp_shockwaveloop
if place_meeting(x, y, obj_solid)
    instance_destroy()
