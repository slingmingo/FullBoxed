draw_set_font(global.creditsfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_self()
draw_text_color(475, 395, displayname, c_white, c_white, c_white, c_white, leveltitlealpha)
draw_set_font(global.smallfont)
if (level != "dragonslair" && level != "tutorial")
{
    draw_text_color(475, 430, string_concat("HIGHSCORE: ", highscore), c_white, c_white, c_white, c_white, leveltitlealpha)
    draw_text_color(475, 450, (secret_count + " OF 3 SECRETS"), c_white, c_white, c_white, c_white, leveltitlealpha)
    draw_sprite_ext(spr_ranks_hud, rankindex, 475, 500, 1, 1, 0, c_white, leveltitlealpha)
}
