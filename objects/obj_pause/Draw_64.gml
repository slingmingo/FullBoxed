if pause
{
    if (!surface_exists(pause_surf))
    {
        pause_surf = surface_create(960, 540)
        surface_set_target(pause_surf)
        draw_surface(application_surface, 0, 0)
        surface_reset_target()
    }
    else
        draw_surface(pause_surf, 0, 0)
    var pad = 48
    draw_sprite_ext(spr_pixel, 0, 0, 0, 960, 540, 0, c_white, pausealpha)
    shader_set(global.Pal_Shader)
    pal_swap_set(spr_palette, paletteselect, 0)
    shader_reset()
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_sprite_ext(spr_pause_border, 0, 640, 180, borderzoom, borderzoom, 0, c_white, (pausealpha * 2))
    draw_sprite_ext(spr_pause_border, 0, 320, 180, (-borderzoom), borderzoom, 0, c_white, (pausealpha * 2))
    var xx = 485
    var yy = 48
    for (var i = 0; i < array_length(pause_menu); i++)
    {
        var c = c_gray
        yy = 96 + pad * i
        if (selected == i)
        {
            c = 16777215
            draw_sprite_ext(spr_cursor, cursor_index, (xx - pushadd - 110), (yy + cursor_sprite_height / 2), 1, 1, 0, c_white, (pausealpha * 2))
        }
        draw_text_color(xx, yy, pause_menu[i], c, c, c, c, (pausealpha * 2))
    }
    xx = 256
    yy = 192
    draw_set_font(global.combofont)
    draw_set_halign(fa_center)
    xx = 485
    yy = 425
    draw_text_color(xx, (yy - 54), global.collect, c_white, c_white, c_white, c_white, (pausealpha * 2))
    var rank = "D"
    if (global.collect >= global.crank)
        rank = "C"
    if (global.collect >= global.brank)
        rank = "B"
    if (global.collect >= global.arank)
        rank = "A"
    if (global.collect >= global.srank)
        rank = "S"
    xx = 395
    yy = 465
    pad = 40
    for (i = 0; i < array_length(toppin_sprite); i++)
        draw_sprite_ext(toppin_sprite[i], toppin_index[i], (xx + pad * i), yy, 1, 1, 0, c_white, (toppin_has[i] ? 1 : pausealpha))
    instance_deactivate_all(true)
    instance_activate_object(obj_inputAssigner)
    instance_activate_object(obj_option)
    instance_activate_object(obj_audioconfig)
    instance_activate_object(obj_keyconfig)
}
else
{
    surface_free(pause_surf)
    pause_surf = -1
}
