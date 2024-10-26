draw_set_alpha(flash)
draw_rectangle_color(-32, -32, (room_width + 32), (room_height + 32), c_white, c_white, c_white, c_white, 0)
draw_set_alpha(1)
if (superattacking == 1)
{
    imindex += 0.15
    draw_sprite_tiled_ext(spr_superattack_bg, 0, 0, (0 + imindex * 5), 1, 1, c_white, (fadein / 3))
    draw_sprite_ext(spr_pixel, 0, 0, 0, 960, 540, 0, c_black, (fadein / 2))
    draw_sprite_ext(superattackHUD, imindex, (-200 + hudpull), 305, 1, 1, 0, c_white, 1)
}
