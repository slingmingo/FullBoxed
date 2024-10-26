function scr_player_revolver() //gml_Script_scr_player_revolver
{
    hsp = xscale * movespeed
    move = key_left + key_right
    landAnim = 0
    if grounded
    {
        if (move != 0 && move == xscale && movespeed < 7)
            movespeed += 0.4
        if (move == 0 || move != xscale)
        {
            movespeed -= 0.1
            if (movespeed < 0)
                movespeed = 0
        }
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_playerV_revolvershoot)
        {
            sprite_index = spr_playerV_holster
            state = states.normal
            landAnim = 1
            image_index = 0
        }
        if (sprite_index == spr_playerV_airrevolver)
        {
            sprite_index = spr_playerV_airrevolverend
            image_index = 0
        }
    }
    if (sprite_index == spr_playerV_revolvershoot && (!grounded))
        sprite_index = spr_playerV_airrevolver
    if ((sprite_index == spr_playerV_airrevolverend || sprite_index == spr_playerV_airrevolver) && grounded)
    {
        if key_attack
            state = states.mach2
        else
            state = states.normal
    }
    if key_down
    {
        state = states.tumble
        image_index = 0
        if grounded
        {
            sprite_index = spr_playerV_crouchslip
            crouchslipbuffer = 25
            if (movespeed < 12.5)
                movespeed = 12.5
        }
        else
        {
            sprite_index = spr_dive
            scr_soundeffect(sfx_dive)
            vsp = 10
        }
    }
    if key_slap2
    {
        if grounded
        {
            sprite_index = spr_playerV_revolvershoot
            image_index = 0
            with (instance_create((x + xscale * 20), (y + 5), obj_shotgunbullet))
            {
                is_solid = 0
                image_xscale = other.xscale
                sprite_index = spr_cheesebullet
                blur_effect = 2
                image_speed = 0.5
            }
            scr_soundeffect(sfx_pistolshot)
        }
        else
        {
            sprite_index = spr_playerV_airrevolver
            image_index = 0
            with (instance_create((x + xscale * 20), (y + 5), obj_shotgunbullet))
            {
                is_solid = 0
                image_xscale = other.xscale
                sprite_index = spr_cheesebullet
                blur_effect = 2
                image_speed = 0.5
            }
            scr_soundeffect(sfx_pistolshot)
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_pistolshot)
    {
        image_index = 0
        state = states.normal
    }
    if (floor(image_index) >= (image_number - 7) && sprite_index == spr_player_pistolshot && key_attack2)
    {
        image_index = 0
        sprite_index = spr_player_pistolshot
        instance_create(x, y, obj_peppinobullet)
    }
    if (sprite_index == spr_player_pistolshot)
        image_speed = 0.55
    else
        image_speed = 0.4
    return;
}

