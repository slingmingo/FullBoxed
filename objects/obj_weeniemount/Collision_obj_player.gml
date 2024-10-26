with (other)
{
    if (state == states.handstandjump || state == states.punch || obj_player.state == states.spin || state == 276)
    {
        state = states.rideweenie
        movespeed = hsp
        sprite_index = spr_rideweenie
        xscale = other.image_xscale
        jumpstop = 1
        if (vsp < 0)
            vsp = 0
        instance_destroy(other)
    }
}
