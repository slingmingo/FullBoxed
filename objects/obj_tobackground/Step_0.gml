with (obj_player)
{
    if (place_meeting(x, (y + 12), other) && key_jump2 && inbg == 0)
    {
        state = states.layerlaunch
        vsp = -9
        movespeed = 0
        hsp = 0
        inbg = 1
        if (character == "P")
            sprite_index = spr_player_Sjumpstart
        else
            sprite_index = spr_deathend
        scr_soundeffect(sfx_explosion)
        instance_deactivate_object(obj_solid)
        instance_deactivate_object(obj_slope)
    }
}
