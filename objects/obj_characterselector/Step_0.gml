charx = lerp(charx, -32, 0.1)
if (texty != 160)
    texty = lerp(texty, 160, 0.5)
if (by1 != 240)
    by1 = lerp(by1, 240, 0.5)
if (by2 != 352)
    by2 = lerp(by2, 352, 0.5)
with (obj_player)
{
    if ((key_up2 && other.selectedchar > 0 && (!audio_is_playing(sfx_collectpizza))) || (key_down2 && other.selectedchar < 2 && (!audio_is_playing(sfx_collectpizza))))
    {
        other.texty = 128
        other.charx = -48
        audio_stop_sound(sfx_enemyprojectile)
        scr_soundeffect(sfx_enemyprojectile)
    }
    if (key_down2 && other.selectedchar >= -1 && (!audio_is_playing(sfx_collectpizza)))
        other.selectedchar -= 1
    if (other.selectedchar <= -1)
        other.selectedchar = 2
    if (other.selectedchar >= 3)
        other.selectedchar = 0
    if (key_up2 && other.selectedchar <= 3 && (!audio_is_playing(sfx_collectpizza)))
        other.selectedchar += 1
    if key_down2
        other.by2 = 368
    if key_up2
        other.by1 = 224
    if (key_jump2 && (!audio_is_playing(sfx_collectpizza)))
    {
        scr_soundeffect(sfx_collectpizza)
        other.alarm[0] = 50
    }
    if (other.selectedchar == 0)
    {
        character = "P"
        ispeppino = 1
        pizzapepper = 0
        pistolAnim = 0
        scr_characterspr()
        paletteselect = 1
    }
    else if (other.selectedchar == 1)
    {
        character = "N"
        ispeppino = 0
        pizzapepper = 0
        pistolAnim = 0
        ispeppino = 0
        scr_characterspr()
        paletteselect = 1
    }
    else if (other.selectedchar == 2)
    {
        character = "V"
        ispeppino = 1
        pizzapepper = 0
        pistolAnim = 0
        scr_characterspr()
        paletteselect = 0
    }
}
if (selectedchar == 0)
{
    chartitle = "PEPPINO"
    sprite_index = spr_peppinoportrait
}
else if (selectedchar == 1)
{
    chartitle = "THE NOISE"
    sprite_index = spr_noiseportrait
}
else if (selectedchar == 2)
{
    chartitle = "THE VIGILANTE"
    sprite_index = spr_vigilanteportrait
}
if (fade == true)
    fadealpha += 0.05
