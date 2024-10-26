function scr_playerN_spin() //gml_Script_scr_playerN_spin
{
    audio_stop_sound(sfx_cancelN)
    move = key_left + key_right
    hsp = movespeed
    if (!inbg)
        vsp = 22
    else
        vsp = 11
    image_speed = 0.5
    if (sprite_index == spr_playerN_tornado_air)
    {
        if (!audio_is_playing(sfx_tornadoair))
            scr_soundeffect(sfx_tornadoair)
        if audio_is_playing(sfx_tornado)
            audio_stop_sound(sfx_tornado)
    }
    if (sprite_index == spr_playerN_tornado)
    {
        if (!audio_is_playing(sfx_tornado))
            scr_soundeffect(sfx_tornado)
        if audio_is_playing(sfx_tornadoair)
            audio_stop_sound(sfx_tornadoair)
    }
    if (movespeed < 12)
        spinspeedmax = 12
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
        if (movespeed < spinspeedmax && move == 1)
            movespeed += 0.75
        if (movespeed > (-spinspeedmax) && move == -1)
            movespeed -= 0.75
    }
    else if (movespeed > 0)
        movespeed /= 1.1
    else
        movespeed /= 1.1
    if (sprite_index == spr_playerN_tornado_land && floor(image_index) == (image_number - 1))
        sprite_index = spr_playerN_tornado
    if (!grounded)
        sprite_index = spr_playerN_tornado_air
    else if (sprite_index == spr_playerN_tornado_air)
        sprite_index = spr_playerN_tornado_land
    if (key_slap2 && grounded)
    {
        state = states.tumble
        if (movespeed < 0)
            movespeed = (-movespeed)
        sprite_index = spr_machroll
        audio_stop_sound(sfx_tornado)
        audio_stop_sound(sfx_tornadoair)
    }
    if ((!key_down) && grounded && (!(place_meeting(x, (y - 16), obj_solid))))
    {
        state = states.walljump
        audio_stop_sound(sfx_tornado)
        audio_stop_sound(sfx_tornadoair)
        if (!inbg)
            vsp = -8
        else
            vsp = -4
        sprite_index = spr_playerN_walljump
        audio_stop_sound(sfx_wallbounce)
        with (instance_create(x, (y + 32), obj_noisehitfx))
            image_xscale = other.xscale
        scr_soundeffect(sfx_wallbounce)
    }
    if place_meeting(x, (y - 32), obj_solid)
        sprite_index = spr_playerN_tornado_land
}

