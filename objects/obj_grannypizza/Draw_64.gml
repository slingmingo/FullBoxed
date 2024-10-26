draw_sprite_ext(spr_tutorialbubble_rope, 0, 60, (hudy - 92), 1, 2, 0, c_white, 1)
draw_sprite_ext(spr_tutorialbubble_rope, 0, 850, (hudy - 92), 1, 2, 0, c_white, 1)
draw_sprite_ext(spr_tutorialbubble, 0, 45, hudy, 9, 1, 0, c_white, 1)
draw_set_font(global.tutorialfont)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
if (hubgranny == 0)
    draw_text_ext_color(55, (hudy + 1), text, 32, 800, c_black, c_black, c_black, c_black, 1)
else
{
    if (obj_player.character == "P")
        draw_text_ext_color(55, (hudy + 1), text, 32, 800, c_black, c_black, c_black, c_black, 1)
    if (obj_player.character == "N")
        draw_text_ext_color(55, (hudy + 1), text2, 32, 800, c_black, c_black, c_black, c_black, 1)
}
if (talking == 1)
    hudy = lerp(hudy, 50, 0.1)
else
    hudy = lerp(hudy, -150, 0.05)
