if (!instance_exists(obj_fadeout))
{
    if (usepal == 1)
        shader_set(global.Pal_Shader)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha)
    if (pal != spr_afterimagepal)
        pal_swap_set(pal, obj_player.paletteselect, 0)
    else
        pal_swap_set(pal, 1, 0)
}
shader_reset()
