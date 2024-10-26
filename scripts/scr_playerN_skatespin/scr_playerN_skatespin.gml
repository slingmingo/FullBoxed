function scr_playerN_skatespin() //gml_Script_scr_playerN_skatespin
{
    hsp = movespeed * xscale
    image_speed = 0.65
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_sjumpcancelstart)
        sprite_index = spr_playerN_sjumpcancelspin
    if (key_jump && key_up)
    {
        sprite_index = Spr_playerN_crusherstart
        scr_soundeffect(sfx_crusherstart)
        audio_stop_sound(sfx_cancelN)
        momemtum = 1
        hsp = movespeed * xscale
        image_index = 0
        state = states.freefall
        vsp = -15
    }
    if (place_meeting((x + xscale), y, obj_solid) && sprite_index != spr_playerN_walljump)
    {
        audio_stop_sound(sfx_wallbounce)
        scr_soundeffect(sfx_wallbounce)
        jumpstop = 0
        vsp = bounceheight
        bounceheight += 2.5
        state = states.walljump
        sprite_index = spr_playerN_walljump
        image_index = 0
        with (instance_create(x, y, obj_noisehitfx))
            image_xscale = other.xscale
    }
    if (key_jump && hypernoise == 1 && character == "N")
    {
        state = states.hypersoar
        image_index = 0
        flash = 1
        alarm[0] = 1
        if (xscale == -1)
            movespeed = (-movespeed)
    }
    if grounded
    {
        audio_stop_sound(sfx_cancelN)
        if key_attack
        {
            state = states.mach2
            movespeed = 12
        }
        else
            state = states.normal
    }
    if key_down
    {
        sprite_index = spr_playerN_tornado_air
        audio_stop_sound(sfx_cancelN)
        state = states.spin
        movespeed *= xscale
        hsp = movespeed
    }
    if (key_slap2 && sprite_index != spr_suplexbump && pistolAnim == 0 && (!key_up) && character != "V" && character != "NE")
    {
        image_index = 0
        sprite_index = spr_suplexdashjumpstart
        flash = 1
        suplexmove = 1
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
        audio_stop_sound(sfx_cancelN)
        sfx_gain(suplexdashsnd)
        if ((!instance_exists(obj_crazyrunothereffect)) && sprite_index != spr_Sjumpcancelstart)
        {
            with (instance_create((x + 12), y, obj_crazyrunothereffect))
                image_speed = 0.55
        }
        state = states.handstandjump
    }
}

