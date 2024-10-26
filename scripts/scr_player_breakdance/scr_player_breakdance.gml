function scr_player_breakdance() //gml_Script_scr_player_breakdance
{
    hsp = movespeed * xscale
    move = key_left + key_right
    if (sprite_index != spr_player_breakdancesuper)
        sprite_index = spr_player_breakdancesuper
    if (sprite_index == spr_player_breakdancesuper)
    {
        if (movespeed < 6)
            state = states.mach2
        image_speed = movespeed / 18
        movespeed -= 0.5
        if key_shoot2
            movespeed = 10
        if place_meeting((x + xscale), y, obj_solid)
        {
            xscale = (-xscale)
            instance_create(x, (y + 32), obj_bumpeffect)
            scr_soundeffect(sfx_bumpwall)
        }
    }
}

