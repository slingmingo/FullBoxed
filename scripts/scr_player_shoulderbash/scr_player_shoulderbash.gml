function scr_player_shoulderbash() //gml_Script_scr_player_shoulderbash
{
    move = key_right + key_left
    move2 = key_right2 + key_left2
    hsp = movespeed * xscale
    pepperwall = 1
    if (sprite_index != spr_pepperman_rolling && sprite_index != spr_hitwall && sprite_index != spr_pepperman_move)
    {
        if ((!audio_is_playing(sfx_mach3M)) && mach4mode == 0)
            scr_soundeffect(sfx_mach3M)
    }
    else
        audio_stop_sound(sfx_mach3M)
    if (mach4mode == 1 && mach4flame > 0)
        mach4flame--
    if (mach4flame <= 0)
    {
        if grounded
            instance_create(x, y, obj_flamecloudeffect)
        mach4flame = 5
    }
    image_speed = 0.4
    if (movespeed < 18 && move == xscale)
    {
        if grounded
        {
            if (movespeed < 14)
                movespeed += 0.1
            else
                movespeed += 0.05
        }
        else
            movespeed += 0.05
    }
    if (movespeed > 12 && move == 0)
        movespeed -= 0.15
    if (movespeed < 21 && move == xscale)
        movespeed += 0.015
    if (movespeed < 40 && movespeed > 20 && move == xscale)
        movespeed += 0.01
    if (movespeed >= 22 && sprite_index != spr_crazyrun)
    {
        sprite_index = spr_crazyrun
        mach4mode = 1
        repeat (3)
        {
            with (create_debris(x, y, spr_slapstar))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
            }
        }
        flash = 1
        alarm[0] = 5
    }
    if (movespeed <= 22 || sprite_index == spr_pepperman_rolling)
        mach4mode = 0
    if (sprite_index == spr_crazyrun)
    {
        if (punch_afterimage > 0)
            punch_afterimage--
        else
        {
            punch_afterimage = 5
            create_blue_afterimage(x, y, sprite_index, image_index, xscale)
        }
    }
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create((x + 18), y, obj_chargeeffect))
        {
            playerid = other.object_index
            other.chargeeffectid = id
        }
    }
    if (move != xscale && move != 0 && grounded && (sprite_index == spr_pepperman_shoulderloop || sprite_index == spr_crazyrun))
    {
        scr_soundeffect(sfx_machslideboost)
        image_index = 0
        sprite_index = spr_pepperman_shoulderturn
        if instance_exists(chargeeffectid)
            instance_destroy(chargeeffectid)
        movespeed /= 1.2
    }
    if (sprite_index == spr_pepperman_shoulderturn || sprite_index == spr_pepperman_shoulderturnloop)
    {
        if (movespeed > 1)
            movespeed -= 0.4
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_pepperman_shoulderturnloop
        if (movespeed < 6 && sprite_index == spr_pepperman_shoulderturnloop && image_index > 3 && grounded)
        {
            xscale = (-xscale)
            image_index = 0
            sprite_index = spr_pepperman_shoulderstart
            movespeed = 14
        }
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_pepperman_shoulderstart)
            sprite_index = spr_pepperman_shoulderloop
    }
    if (grounded && sprite_index == spr_pepperman_rolling)
    {
        if (movespeed > 22)
            sprite_index = spr_crazyrun
        else
            sprite_index = spr_pepperman_shoulderloop
    }
    scr_dotaunt()
    if ((!key_attack) && sprite_index != spr_pepperman_shoulderstart && sprite_index != spr_pepperman_shoulderturnloop && sprite_index != spr_pepperman_shoulderstart)
    {
        if grounded
        {
            state = states.normal
            sprite_index = spr_pepperman_move
            audio_stop_sound(sfx_mach3M)
        }
        else if (sprite_index != spr_pepperman_rolling)
        {
            state = states.jump
            sprite_index = spr_pepperman_fall
            audio_stop_sound(sfx_mach3M)
        }
    }
    if (key_jump && grounded && sprite_index != spr_pepperman_shoulderturn && sprite_index != spr_pepperman_shoulderturnloop)
    {
        vsp = -11
        with (instance_create(x, (y - 5), obj_highjumpcloud2))
            image_xscale = other.xscale
    }
    if (key_down2 && (!grounded))
    {
        state = states.freefall
        freefallsmash = 12
        vsp = -6
        image_index = 0
        audio_stop_sound(sfx_mach3M)
        sprite_index = spr_pepperman_groundpoundstart
    }
    if (movespeed < 12 && sprite_index == spr_pepperman_shoulderloop)
        movespeed = 12
    if ((!key_jump2) && (!grounded) && vsp < 0)
        vsp /= 20
    if (scr_solid((x + 1 * xscale), (y - 2)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        if ((!grounded) && (!(place_meeting(x, (y - 16), obj_solid))) && sprite_index != spr_pepperman_shoulderturn && sprite_index != spr_pepperman_shoulderturnloop)
        {
            sprite_index = spr_pepperman_rolling
            state = states.climbwall
            wallspeed = (-vsp) + movespeed / 4
            scr_soundeffect(sfx_bumpwall)
            image_speed = 0.7
            with (obj_baddie)
            {
                if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), ((__view_get(0, 0)) + (__view_get(2, 0))), ((__view_get(1, 0)) + (__view_get(3, 0))))
                {
                    stun = 1
                    alarm[0] = 200
                    ministun = 0
                    vsp = -5
                    hsp = 0
                }
            }
            flash = 0
            image_index = 0
        }
        if (grounded && sprite_index != spr_pepperman_shoulderturnloop)
        {
            sprite_index = spr_hitwall
            scr_soundeffect(sfx_groundpound)
            scr_soundeffect(sfx_bumpwall)
            with (obj_camera)
            {
                shake_mag = 20
                shake_mag_acc = 40 / room_speed
            }
            hsp = 0
            image_speed = 0.35
            with (obj_baddie)
            {
                if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), ((__view_get(0, 0)) + (__view_get(2, 0))), ((__view_get(1, 0)) + (__view_get(3, 0))))
                {
                    stun = 1
                    alarm[0] = 200
                    ministun = 0
                    vsp = -5
                    hsp = 0
                }
            }
            flash = 0
            state = states.bump
            hsp = -4.5 * xscale
            audio_stop_sound(sfx_mach3M)
            vsp = -6
            mach2 = 0
            image_index = 0
            instance_create((x + 10), (y + 10), obj_bumpeffect)
        }
    }
    if (grounded && key_down)
    {
        state = states.machroll
        image_index = 0
        image_speed = 1
        sprite_index = spr_pepperman_rolling
        audio_stop_sound(sfx_mach3M)
        pepperwall = 1
    }
    return;
}

