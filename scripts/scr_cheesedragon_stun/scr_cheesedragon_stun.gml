function scr_cheesedragon_stun() //gml_Script_scr_cheesedragon_stun
{
    if (y < 350)
        vsp += 0.5
    if (y >= 350)
    {
        vsp = 0
        hsp = 0
        if (y < 350)
            y = 350
    }
    if (!audio_is_playing(sfx_vulnerable))
        scr_soundeffect(sfx_vulnerable)
    if place_meeting((x + hsp), y, obj_solid)
        hsp = 0
}

