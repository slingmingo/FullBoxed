with (other)
{
    if (state != states.trashroll && state != states.trashjump && state != states.cheeseball)
    {
        scr_soundeffect(sfx_bananaslip)
        sprite_index = spr_slipbanan1
        other.drop = 1
        vsp = -11
        if (movespeed > 0)
        {
            movespeed += 2
            if (movespeed > 14)
                movespeed = 14
        }
        else
        {
            movespeed -= 2
            if (movespeed < -14)
                movespeed = -14
        }
        image_index = 0
        state = states.slipbanan
    }
    instance_destroy(other)
}
