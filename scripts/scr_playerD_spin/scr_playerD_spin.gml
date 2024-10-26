function scr_playerD_spin() //gml_Script_scr_playerD_spin
{
    doublejump = 0
    move = key_left + key_right
    hsp = movespeed * xscale
    if (move != 0)
    {
        if (move != xscale)
            state = states.normal
        xscale = move
        if (movespeed < 8)
            movespeed += 0.5
        if (movespeed > 14)
            movespeed -= 0.5
    }
    else
    {
        if (movespeed > 14)
            movespeed -= 1
        if (movespeed < 0)
            movespeed = 0
    }
    sprite_index = spr_playerD_spin
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
    {
        if (!key_attack)
            state = states.normal
        else
            state = states.pogo
    }
    if (key_jump && grounded)
    {
        if ((!key_down) && key_attack)
        {
            jumpstop = 0
            image_index = 0
            if (!inbg)
                vsp = -11
            else
                vsp = -5.5
            state = states.pogo
            sprite_index = spr_playerN_pogostart
            pogospeed = 14
        }
        else
        {
            state = states.jump
            sprite_index = spr_jump
            image_index = 0
            if (!inbg)
                vsp = -11
            else
                vsp = -5.5
        }
    }
    if place_meeting((x + xscale), y, obj_solid)
    {
        state = states.jump
        sprite_index = spr_suplexbump
        scr_soundeffect(sfx_bumpwall)
        image_speed = 0.35
        vsp = -4
    }
    if (key_down && grounded && isswimming == false)
    {
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        if (movespeed < 12)
            movespeed = 12
        crouchslipbuffer = 25
        grav = 0.5
        sprite_index = spr_crouchslip
        slidetojumpbuffer = 0
        image_index = 0
        machhitAnim = 0
        state = states.tumble
    }
}

