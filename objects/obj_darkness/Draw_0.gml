if (!surface_exists(surf))
    surf = surface_create(room_width, room_height)
surface_set_target(surf)
draw_sprite_ext(spr_pixel, 0, 0, 0, room_width, room_height, 0, c_black, 0.55)
gpu_set_colorwriteenable(1, 1, 1, 0)
draw_sprite(spr_lightsource, 0, obj_player.x, obj_player.y)
gpu_set_colorwriteenable(1, 1, 1, 1)
surface_reset_target()
draw_surface(surf, 0, 0)