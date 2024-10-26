function scr_cheesedragon_damaged() //gml_Script_scr_cheesedragon_damaged
{
    audio_stop_sound(sfx_vulnerable)
    if (y < 350)
        vsp += 0.5
    if (y >= 350)
    {
        vsp = -6
        hsp /= 1.1
    }
    if (sprite_index != spr_cheesedragon_hurt2)
        sprite_index = spr_cheesedragon_thrown
    if place_meeting((x + hsp), y, obj_solid)
    {
        hsp = (-hsp)
        sprite_index = spr_cheesedragon_hurt2
        image_xscale = (-image_xscale)
    }
}

