with (obj_player)
{
    if (state != states.trickjump)
    {
        state = states.trickjump
        sprite_index = spr_player_kungfujump
        image_speed = -1
        vsp = -16
        ramp_buffer = 5
        catapulted = 1
        movespeed = other.launchstrength * other.launchxscale
        xscale = other.launchxscale
    }
}
