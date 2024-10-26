function scr_playerN_hypersoar() //gml_Script_scr_playerN_hypersoar
{
    if (sprite_index != spr_playerN_phase3intro2)
    {
        move = key_left + key_right
        movev = key_down - key_up
    }
    else
    {
        movev = 0
        move = 0
        camera_zoom(0.75, 0.5)
    }
    if (!audio_is_playing(sfx_hypernoisehover))
        audio_play_sound(sfx_hypernoisehover, 1, true, (1 * global.option_sfx_volume), 0, 1)
    audio_sound_pitch(sfx_hypernoisehover, abs(movespeed / 25))
    hsp = movespeed
    vsp = vmovespeed
    mask_index = spr_hypermask
    if (hypernoise == 0)
        state = states.normal
    grav = 0
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_phase3intro2)
        sprite_index = spr_playerN_hyperidle
    image_speed = 0.35
    if (sprite_index != spr_playerN_phase3intro2)
    {
        if (move == 0)
            sprite_index = spr_playerN_hyperidle
        else
            sprite_index = spr_playerN_phase3intro3
    }
    if (move != 0)
    {
        xscale = move
        if (movespeed < 17 && move == 1)
            movespeed += 1
        if (movespeed > -17 && move == -1)
            movespeed -= 1
    }
    else if (movespeed > 0)
        movespeed /= 1.2
    else
        movespeed /= 1.2
    if (movev != 0)
    {
        if (vmovespeed < 12 && movev == 1)
            vmovespeed += 1
        if (vmovespeed > -12 && movev == -1)
            vmovespeed -= 1
    }
    else if (vmovespeed > 0)
        vmovespeed /= 1.1
    else
        vmovespeed /= 1.1
    if (movespeed >= 16.5 && scr_solid((x + xscale), y) && (!scr_slope()) && (!(place_meeting((x + xscale), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && ((!(place_meeting((x + xscale), y, obj_destructibles))) || fightball == 1))
    {
        if (fightball == 0)
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
            if (!inbackground)
            {
                hsp = 4.5 * (-xscale)
                vsp = -6
            }
            else
            {
                hsp = 2.25 * (-xscale)
                vsp = -3
            }
            mach2 = 0
            image_index = 0
            instance_create((x - 10), (y + 10), obj_bumpeffect)
        }
        else if (fightball == 1)
        {
            with (obj_player)
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
                audio_stop_sound(sfx_hypernoisehover)
                hsp = -2.5
                vsp = -3
                mach2 = 0
                image_index = 0
                instance_create((x + 10), (y + 10), obj_bumpeffect)
            }
            fightball = 0
        }
    }
    if (key_jump && (!(place_meeting(x, (y - 32), obj_solid))))
    {
        mask_index = spr_player_mask
        state = states.mach2
        sprite_index = spr_playerN_mach2jump
        if (movespeed < 0)
            movespeed = (-movespeed)
        vsp = -10
    }
    if place_meeting((x + movespeed), y, obj_solid)
        movespeed /= 1.2
    if place_meeting(x, (y + vmovespeed), obj_solid)
        vmovespeed /= 1.2
    if ((!instance_exists(obj_spinhitbox)) && move != 0)
    {
        var _playerid = obj_gamestarter
        with (instance_create(x, y, obj_spinhitbox))
            playerid = _playerid
    }
    else if instance_exists(obj_spinhitbox)
        instance_destroy(obj_spinhitbox)
}

