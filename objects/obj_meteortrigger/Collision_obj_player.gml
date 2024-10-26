with (obj_player)
{
    if (state != states.meteorpep)
    {
        icedir = xscale
        sprite_index = spr_meteorpep_start
        image_index = 0
        state = states.meteorpep
        scr_soundeffect(sfx_punch)
        with (create_debris(x, y, spr_slapstar))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
}
