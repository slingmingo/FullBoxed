shader_set(global.Pal_Shader)
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if is_bossroom()
    return;
var collect_x = irandom_range((-collect_shake), collect_shake)
var collect_y = irandom_range((-collect_shake), collect_shake)
var tv_x = 845
var tv_y = 80
var _cx = tv_x + combo_posX
var _cy = tv_y + 117 + hud_posY + combo_posY
var _perc = global.combotime / 60
var _minX = _cx - 56
var _maxX = _cx + 59
combofill_x = lerp(combofill_x, (_minX + (_maxX - _minX) * _perc), 0.5)
combofill_y = _cy
if (!global.combodropped)
    draw_sprite(spr_tv_combobubblefill, combofill_index, round(combofill_x), round(combofill_y))
else
    draw_sprite(spr_tv_combobubblefill2, combofill_index, round(combofill_x), round(combofill_y))
draw_sprite(spr_tv_combobubble, -1, round(_cx), round(_cy))
draw_set_font(global.combofont2)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var _tx = _cx - 64
var _ty = _cy - 12
var _str = string(global.combo)
var num = string_length(_str)
for (var i = num; i > 0; i--)
{
    var char = string_char_at(_str, i)
    draw_text(round(_tx + shakeplus), round(_ty + shakeplus), char)
    _tx -= 22
    _ty -= 8
}
if (room != rm_blank)
{
    draw_sprite_ext(spr_tv_bg, bgindex, (tv_x + collect_x), (tv_y + collect_y + hud_posY), 1, 1, 0, c_white, alpha)
    if (obj_player.character == "P")
        pal_swap_set(spr_peptvpalette, obj_player.paletteselect, 0)
    else if (obj_player.character == "N")
        pal_swap_set(spr_noisetvpalette, obj_player.paletteselect, 0)
    else if (obj_player.character == "V")
        pal_swap_set(spr_vigitvpalette, obj_player.paletteselect, 0)
    draw_sprite_ext(sprite_index, image_index, (tv_x + collect_x), (tv_y + collect_y + hud_posY), 1, 1, 0, c_white, alpha)
}
if (room != rm_blank)
{
    pal_swap_set(spr_tvpalette, tvframepaletteselect, 0)
    draw_sprite_ext(tvdefault, image_index, (tv_x + collect_x), (tv_y + collect_y + hud_posY), 1, 1, 0, c_white, alpha)
}
shader_reset()
if (bubblespr != -4)
    draw_sprite_ext(bubblespr, bubbleindex, 512, 53, 1, 1, 1, c_white, alpha)
if (!surface_exists(promptsurface))
    promptsurface = surface_create(290, 102)
surface_set_target(promptsurface)
draw_clear_alpha(c_black, 0)
draw_set_font(global.bigfont)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
if (bubblespr == spr_tv_bubble)
{
    promptx -= promptspd
    if (bubblespr != spr_tv_bubbleclose && promptx < (350 - string_width(prompt)))
    {
        bubblespr = spr_tv_bubbleclose
        bubbleindex = 0
    }
    draw_text_color((promptx - 350), 50, prompt, c_white, c_white, c_white, c_white, 1)
}
draw_set_halign(fa_left)
surface_reset_target()
draw_surface(promptsurface, 350, 0)
draw_set_font(global.smallnumber_fnt)
draw_set_halign(fa_center)
if instance_exists(obj_pizzaball)
    draw_text(832, 300, (string(global.golfhit) + " " + "GOLF HIT"))
if (global.panic && (!global.timeattack))
{
    var _fill = global.fill
    var _currentbarpos = chunkmax - _fill
    _perc = _currentbarpos / chunkmax
    var _max_x = 299
    var _barpos = _max_x * _perc
    if (!surface_exists(bar_surface))
        bar_surface = surface_create(298, 30)
    var _barfillpos = floor(_barpos) + 13
    if (_barfillpos > 0)
    {
        surface_resize(bar_surface, _barfillpos, 30)
        surface_set_target(bar_surface)
        draw_clear_alpha(c_black, 0)
        var clip_x = timer_x + 3
        var clip_y = timer_y + 5
        for (i = 0; i < 3; i++)
            draw_sprite_ext(spr_timer_barfill, 0, (barfill_x + i * 173), 0, 1, 1, 0, barcolor, 1)
        surface_reset_target()
        draw_surface(bar_surface, clip_x, clip_y)
    }
    draw_sprite(spr_timer_bar, -1, timer_x, timer_y)
    draw_sprite(johnface_sprite, johnface_index, (timer_x + 13 + _barpos), (timer_y + 20))
    draw_sprite(pizzaface_sprite, pizzaface_index, (timer_x + 320), (timer_y + 10))
    draw_set_font(global.lapfont)
    if (global.laps >= 1)
    {
        draw_sprite(spr_lapcounter, imindex, 823, 454)
        draw_text(855, 482, (global.laps + 1))
    }
    draw_set_font(global.bigfont)
    draw_text_color((timer_x + 154), (timer_y + 19), string_concat(global.minutes, ":", timerseconds), c_white, c_white, barcolor, barcolor, 1)
}
