draw_set_font(global.smallfont)
draw_sprite_tiled_ext(spr_tutorialBG1, 0, bgscroll, bgscroll, 1, 1, c_purple, (fade / 2))
if (obj_gamestarter.canstart == 1)
{
    draw_sprite(spr_menubg, 1, menpepx, 0)
    draw_sprite(sprite_index, image_index, (menpepx + 391), 182)
}
else if (jumpscaring == 0)
    draw_sprite(spr_menudark, 0, 0, 0)
if (move == 1)
{
    draw_sprite_ext(spr_demotitle, 0, 221, 121, 1, squash, 0, c_white, fade)
    draw_text_color(226, 355, text_array[splashtext], c_yellow, c_yellow, c_yellow, c_yellow, fade)
    draw_sprite(spr_cursor, cursorindex, 140, (380 + selected * 25))
    draw_text_color(225, 380, "START", c_white, c_white, c_white, c_white, (selected == 0 ? 1 : 0.5))
    draw_text_color(225, 405, "OPTIONS", c_white, c_white, c_white, c_white, (selected == 1 ? 1 : 0.5))
    draw_text_color(225, 430, "CREDITS", c_white, c_white, c_white, c_white, (selected == 2 ? 1 : 0.5))
    draw_text_color(225, 455, "QUIT", c_white, c_white, c_white, c_white, (selected == 3 ? 1 : 0.5))
}
if (jumpscaring == 1)
    draw_sprite_ext(spr_mainmenu_jumpscare, 0, (menpepx + 500), 300, scarescale, scarescale, 0, c_white, 1)
