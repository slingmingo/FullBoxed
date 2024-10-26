if (sprite_index != spr_mortspawn && sprite_index != spr_mortfall)
{
    with (other)
    {
        if (state != states.mort && state != states.mortjump && state != states.mortattack && state != states.morthook && state != states.ridecow)
        {
            repeat (6)
                create_debris(x, y, spr_feather)
            mort = 1
            sprite_index = spr_player_mortidle
            instance_create_unique(x, y, obj_mortfollow)
            scr_soundeffect(sfx_mortpickup)
            state = states.mort
            instance_destroy(other)
        }
    }
}
