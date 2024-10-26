function scr_player_hook() //gml_Script_scr_player_hook
{
    if instance_exists(hookid)
    {
        xscale = hookid.image_xscale
        y = hookid.y + 24
        x = hookid.x - 8
        if (!audio_is_playing(sfx_knightslide))
            scr_soundeffect(sfx_knightslide)
    }
    else
    {
        state = states.normal
        vsp = 0
    }
    if key_jump
    {
        movespeed = hookid.hookspeed
        state = states.mach2
        sprite_index = spr_mach2jump
        image_index = 0
        vsp = -11
        jumpstop = 0
    }
    return;
}

