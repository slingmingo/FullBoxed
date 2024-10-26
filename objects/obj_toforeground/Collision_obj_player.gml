if (place_meeting(x, y, obj_player) && obj_player.inbg == 1)
{
    with (obj_player)
    {
        state = states.layerlaunch
        vsp = -10
        inbg = 0
        movespeed = 0
        hsp = 0
        if (character == "P")
            sprite_index = spr_player_Sjumpstart
        else
            sprite_index = spr_deathend
        scr_soundeffect(sfx_explosion)
        instance_activate_object(obj_solid)
        instance_activate_object(obj_slope)
        instance_deactivate_object(obj_bgsolid)
    }
}
