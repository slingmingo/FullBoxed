function scr_player_knightpepslopes() //gml_Script_scr_player_knightpepslopes
{
    if ((x + hsp) == xprevious)
        slope_buffer--
    else
        slope_buffer = 20
    alarm[5] = 2
    alarm[7] = 60
    if (knightmiddairstop == 0)
        hsp = xscale * movespeed
    image_speed = 0.35
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if ((!scr_slope()) && grounded)
        sprite_index = spr_knightpepcharge
    if scr_slope()
    {
        if (vsp > 0)
        {
            if scr_slope()
            {
                sprite_index = spr_knightpepdownslope
                with (instance_place(x, (y + 1), obj_slope))
                {
                    if (sign(image_xscale) == other.xscale)
                        other.sprite_index = other.spr_knightpepupslope
                }
            }
        }
    }
    if (input_buffer_jump < 8)
    {
        if (grounded || (!doublejump))
        {
            vsp = -11
            sprite_index = spr_knightpepfly
            image_index = 0
            input_buffer_jump = 8
            if (!grounded)
            {
                vsp = -11
                doublejump = 1
                sprite_index = spr_knightpepdoublejump
            }
        }
    }
    if (sprite_index == spr_knightpepjumpstart)
    {
        hsp = 0
        vsp = 0
    }
    if ((sprite_index == spr_knightpepdoublejump || sprite_index == spr_knightpepfly) && floor(image_index) == (image_number - 1))
        image_index = image_number - 1
    if (scr_solid((x + sign(hsp)), y) && ((!scr_slope()) || place_meeting((x + sign(hsp)), (y - 2), obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        instance_create((x + xscale * 40), y, obj_bumpeffect)
        if (character == "P" || character == "D")
        {
            movespeed = 0
            vsp = -6
            sprite_index = spr_knightpepbump
            with (obj_music)
                audio_sound_pitch(musicID, 0.9)
            image_index = floor(image_number - 1)
            state = states.knightpepbump
            scr_soundeffect(sfx_groundpound)
        }
        else if (character == "N")
        {
            scr_soundeffect(sfx_groundpound)
            xscale = (-xscale)
        }
    }
    if scr_slope()
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            if (other.xscale == (-sign(image_xscale)))
            {
                if (other.movespeed < 14)
                    other.movespeed += 0.25
            }
        }
    }
    with (obj_music)
    {
        var p = audio_sound_get_pitch(musicID)
        if (p < 1.2)
            p += 0.025
        audio_sound_pitch(musicID, p)
    }
    if ((!grounded) && key_down2 && sprite_index != spr_knightpepdownthrust)
    {
        with (instance_create(x, y, obj_parryeffect))
            sprite_index = spr_knightpep_downcloud
        sprite_index = spr_knightpepdownthrust
        vsp = -5
        hsp = 0
        movespeed = 0
        state = states.knightpep
    }
    return;
}

