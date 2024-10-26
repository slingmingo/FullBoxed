if (obj_player.character == "N")
{
    shader_set(global.Pal_Shader)
    pal_swap_set(spr_palette, obj_player.paletteselect, 0)
}
draw_sprite(sprite_index, image_index, x, y)
