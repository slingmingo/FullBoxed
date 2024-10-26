draw_sprite_ext(spr_pixel, 0, 0, 0, 960, 540, 0, c_black, fade)
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, obj_player1.x, obj_player1.y, obj_player1.xscale, obj_player1.yscale, 1, c_white, 1)
draw_sprite_ext(spr_pixel, 0, 0, 0, 960, 540, 0, c_black, fade2)
