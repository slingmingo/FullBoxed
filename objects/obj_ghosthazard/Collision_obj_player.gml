with (other)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if ((!isgustavo) && state != states.ghost && state != states.ghostpossess && state != states.actor && state != states.parry && state != states.gotoplayer)
    {
        scr_losepoints()
        grav /= 2
        state = states.ghost
        sprite_index = spr_ghostidle
        scr_soundeffect(sfx_transform)
        with (instance_create(x, y, obj_sausageman_dead))
        {
            hsp = other.image_xscale * 3
            image_xscale = (-other.image_xscale)
            sprite_index = other.spr_dead
        }
        other.debris = 0
    }
}
