function scr_player_spindash() //gml_Script_scr_player_spindash
{
    if (spindelay > 0)
        spindelay--
    if (movespeed > 0)
        movespeed -= 0.5
    if (movespeed < 0)
        movespeed = 0
    if (key_jump && spindelay == 0)
    {
        spindelay = 9
        if (dashspeed < 22)
            dashspeed += 1.2
        audio_stop_sound(sfx_spindash)
        audio_play_sound(sfx_spindash, 1, false, global.option_sfx_volume, 0, (dashspeed / 12))
        image_speed = dashspeed / 18
    }
    if ((!key_down) && spindelay == 0)
    {
        state = states.mach3
        sprite_index = spr_mach4
        scr_soundeffect(sfx_dashout)
        movespeed = dashspeed
    }
    return;
}

