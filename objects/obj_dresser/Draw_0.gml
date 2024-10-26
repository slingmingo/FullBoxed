draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
draw_set_font(global.creditsfont)
draw_set_halign(fa_center)
draw_text_color(x, (y - 60), string_concat(obj_player1.paletteselect, " of ", text), c_white, c_white, c_white, c_white, image_alpha)
