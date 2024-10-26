function scr_playerN_walljump() //gml_Script_scr_playerN_walljump
{
    move = key_left + key_right
    hsp = movespeed
    image_speed = 0.55
    if (punch_afterimage > 0)
        punch_afterimage--
    else
    {
        punch_afterimage = 5
        create_blue_afterimage(x, y, sprite_index, image_index, xscale)
    }
    if (move != 0)
    {
        xscale = move
        if (movespeed > 8)
            movespeed -= 0.45
        if (movespeed < -8)
            movespeed += 0.5
        if (movespeed < 7 && move == 1)
            movespeed += 0.9
        if (movespeed > -7 && move == -1)
            movespeed -= 0.9
    }
    else if (movespeed > 0)
        movespeed /= 1.1
    else
        movespeed /= 1.1
    if key_slap2
    {
        image_index = 0
        audio_stop_sound(sfx_wallbounce)
        scr_soundeffect(sfx_cancelN)
        sprite_index = spr_playerN_sjumpcancelstart
        state = states.mach2
        if (vsp > -5)
            vsp = -5
        movespeed = 13
        if (!instance_exists(obj_crazyrunothereffect))
        {
            with (instance_create((x + 12), y, obj_crazyrunothereffect))
                image_speed = 0.55
        }
    }
    if key_down2
    {
        sprite_index = spr_playerN_tornado_air
        state = states.spin
    }
    if grounded
    {
        if key_attack
        {
            state = states.mach2
            if (spinspeedmax > 13)
                movespeed = spinspeedmax + 3
            else
                movespeed = 13
        }
        else
        {
            state = states.normal
            if (movespeed < 0)
                movespeed = (-movespeed)
        }
    }
    if (key_jump && hypernoise == 1 && character == "N")
    {
        state = states.hypersoar
        image_index = 0
        flash = 1
        alarm[0] = 1
    }
    if (key_jump && key_up && character == "N")
    {
        sprite_index = Spr_playerN_crusherstart
        scr_soundeffect(sfx_crusherstart)
        image_index = 0
        state = states.freefall
        vsp = -15
    }
}

