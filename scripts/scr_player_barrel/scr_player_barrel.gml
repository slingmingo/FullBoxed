function scr_player_barrel() //gml_Script_scr_player_barrel
{
    image_speed = abs(movespeed) / 4
    if (image_speed < 0.35)
        image_speed = 0.35
    if (image_speed > 0.85)
        image_speed = 0.85
    hsp = movespeed * xscale
    move = key_right + key_left
    if key_jump
        input_buffer_jump = 0
    if (move != 0)
    {
        if (move == xscale)
            movespeed = Approach(movespeed, 8, 0.5)
        else
            movespeed = Approach(movespeed, 0, 0.5)
        if (movespeed <= 0)
            xscale = move
    }
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if (sprite_index == spr_barrelland && floor(image_index) == (image_number - 1))
        sprite_index = spr_barrelidle
    if grounded
    {
        if (sprite_index != spr_barrelland)
        {
            if (hsp != 0)
                sprite_index = spr_barrelmove
            else
                sprite_index = spr_barrelidle
        }
        if (scr_slope() && hsp != 0)
        {
            with (instance_place(x, (y + 1), obj_slope))
            {
                if (sign(image_xscale) == (-sign(other.xscale)))
                    other.movespeed = Approach(other.movespeed, 12, 0.5)
            }
        }
        if (input_buffer_jump < 8 && (!key_down))
        {
            scr_soundeffect(sfx_jump)
            input_buffer_jump = 8
            vsp = -8.5
            if (move != xscale && move != 0)
            {
                if (sign(movespeed) == 1)
                    xscale = move
            }
            state = states.barreljump
            sprite_index = spr_barreljump
            image_index = 0
            jumpstop = 0
            create_particle(x, y, 3, 0)
        }
        if key_attack
        {
            movespeed = 7
            instance_create(x, y, obj_jumpdust)
            state = states.barrelslide
            sprite_index = spr_player_barrelslipnslide
            image_index = 0
        }
    }
    else
    {
        state = states.barreljump
        sprite_index = spr_barrelfall
        image_index = 0
        if (vsp < 0)
            sprite_index = spr_barreljump
    }
    if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        movespeed = 0
        if (sprite_index == spr_barrelmove)
            sprite_index = spr_barrelidle
    }
    if (sprite_index == spr_barrelmove)
    {
        if ((!steppy) && (floor(image_index == 4) || floor(image_index) == 13))
        {
            create_particle(x, (y + 43), 1, 0)
            steppy = 1
        }
        if (floor(image_index) != 4 && floor(image_index) != 13)
            steppy = 0
    }
    return;
}

