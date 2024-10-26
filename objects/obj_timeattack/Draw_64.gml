if (global.timeattack == 1 && room != rank_room)
{
    draw_sprite(spr_bosstimer_bar, 0, 259, 462)
    if (global.taseconds < 10)
    {
        draw_set_font(global.bigfont)
        draw_set_halign(fa_center)
        draw_text_color(((random_range(1, -1)) + 480), ((random_range(1, -1)) + 485), string_hash_to_newline(string(global.taminutes) + ":0" + string(global.taseconds) + ":0" + string(global.tamiliseconds)), c_white, c_white, c_red, c_red, 1)
    }
    else if (global.taseconds >= 10)
    {
        draw_set_font(global.bigfont)
        draw_set_halign(fa_center)
        draw_text_color(((random_range(1, -1)) + 480), ((random_range(1, -1)) + 485), string_hash_to_newline(string(global.taminutes) + ":" + string(global.taseconds) + ":" + string(global.tamiliseconds)), c_white, c_white, c_red, c_red, 1)
    }
}
