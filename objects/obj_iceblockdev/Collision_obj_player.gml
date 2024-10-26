with (obj_player)
{
    if (state != states.iceblock)
    {
        icedir = xscale
        sprite_index = spr_player_iceblock
        state = states.iceblock
        if (movespeed < 5)
            movespeed = 5
    }
}
