shader_set(global.Pal_Shader)
if palactive
    draw_sprite_ext(spr_pixel, 0, 0, 0, 960, 540, 0, make_color_rgb(209, 104, 39), 1)
if (!palactive)
    pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
else
    pal_swap_set(spr_rankpal, 1, 0)
draw_sprite_ext(sprite_index, image_index, (x + shake), (y + shake), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
shader_reset()
if canexit
{
    draw_set_halign(fa_left)
    draw_text(10, 465, string_concat("SCORE: ", global.collect))
    draw_text(10, 500, string_concat("SECRETS: ", global.secretfound, " OF 3"))
}
