with (other)
{
    if (character == "V")
        scr_hurtplayer(object_index)
    else if scr_transformationcheck()
    {
        if (state != states.firemouth && state != states.parry && hurted == 0)
        {
            is_firing = 0
            scr_soundeffect(sfx_firemouthstart)
            hsp = 0
            movespeed = 0
            state = states.firemouth
            image_index = 0
            sprite_index = spr_firemouthintro
            state = states.firemouth
            bombpeptimer = 3
            instance_destroy(other)
        }
    }
}
