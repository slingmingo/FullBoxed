with (obj_player)
{
    if (state != states.hook && other.hsp == 0)
    {
        state = states.hook
        vsp = 0
        hookid = other.id
        hookid.active = 1
        movespeed += hookid.hsp
        hookid.movespeed = movespeed
        sprite_index = spr_player_hangslide
        image_speed = 0.4
        xscale = other.image_xscale
        y = hookid.y + 30
        x = hookid.x
    }
}
