function scr_player_tumble() //gml_Script_scr_player_tumble
{
    if (sprite_index == spr_Sjumpcancelstart && character == "N")
        state = states.mach2
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    hsp = xscale * movespeed + railmovespeed * raildir
    move = key_right + key_left
    if (sprite_index == spr_tumblestart)
        movespeed = 6
    if ((!grounded) && (sprite_index == spr_faceplantslide || sprite_index == spr_machroll || sprite_index == spr_mach2jump || sprite_index == spr_machroll2 || sprite_index == spr_machroll2land))
    {
        if (!inbackground)
            vsp = 10
        else
            vsp = 5
        if (character != "N" && sprite_index != Spr_playerN_crusherstart)
            sprite_index = spr_dive
        else
        {
            sprite_index = spr_playerN_tornado_air
            state = states.spin
            movespeed *= xscale
            spinspeedmax = movespeed * xscale
        }
    }
    if (sprite_index == spr_crouchslip && character == "D" && key_jump2)
    {
        vsp = -11
        state = states.jump
        sprite_index = spr_jump
        image_index = 0
        scr_soundeffect(sfx_jumpN)
    }
    if (grounded && (sprite_index == spr_dive || sprite_index == spr_player_diveintro))
    {
        sprite_index = spr_faceplantslide
        facehurt = 1
        image_index = 0
        if (character == "S")
            state = states.mach2
    }
    if (grounded && sprite_index != spr_tumble)
        movespeed -= 0.035
    if ((sprite_index == spr_dive || sprite_index == spr_player_diveintro || sprite_index == spr_jumpdive1 || sprite_index == spr_jumpdive2) && key_jump)
    {
        if ((sprite_index == spr_dive || sprite_index == spr_player_diveintro) && (!(place_meeting(x, (y - 64), obj_solid))))
            vsp = -6
        sprite_index = spr_groundpoundcancel
        image_index = 0
        state = states.freefall
        if (character == "D")
        {
            sprite_index = Spr_playerN_crusherstart
            vsp = -12
            scr_soundeffect(sfx_crusherstart)
        }
    }
    if (movespeed > 28)
        movespeed = 28
    if (movespeed <= 4 && sprite_index != spr_player_breakdance && sprite_index != spr_playerN_tornado && sprite_index != spr_playerN_tornado_air)
    {
        if (!grounded)
            state = states.normal
        else
            state = states.crouch
    }
    if ((!scr_slope()) && sprite_index == spr_tumblestart && floor(image_index) < 11)
        image_index = 11
    if (sprite_index == spr_mach2jump && grounded)
    {
        image_index = 0
        facehurt = 1
        sprite_index = spr_faceplantslide
    }
    if ((sprite_index == spr_dive || sprite_index == spr_player_diveintro) && grounded)
    {
        image_index = 0
        facehurt = 1
        sprite_index = spr_faceplantslide
    }
    if (sprite_index == spr_player_diveintro && floor(image_index) == (image_number - 1))
        sprite_index = spr_dive
    if (sprite_index == spr_dive || sprite_index == spr_player_diveintro)
    {
        scr_dotaunt()
        image_speed = 0.35
    }
    if (sprite_index == spr_player_crouchslip)
    {
        if (slidetojumpbuffer > 0)
            slidetojumpbuffer--
    }
    if (sprite_index == spr_player_Sjumpcancelland && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_Sjumpcancelslide
    if ((sprite_index == spr_jumpdive1 && grounded) || (sprite_index == spr_jumpdive2 && grounded))
        sprite_index = spr_crouchslip
    if (floor(image_index) == (image_number - 1) && character != "V" && sprite_index == spr_machroll2land && sprite_index != spr_faceplantslide)
    {
        sprite_index = spr_machroll2
        image_index = 0
    }
    if (floor(image_index) == (image_number - 1) && movespeed > 12 && sprite_index == spr_machroll && character != "V" && (!(place_meeting(x, (y + 4), obj_slope))))
        sprite_index = spr_machroll2land
    if ((sprite_index == spr_machroll || sprite_index == spr_faceplantslide || sprite_index == spr_crouchslip) && (!grounded))
    {
        if (character != "N")
        {
            if (sprite_index != Spr_playerN_crusherstart)
                sprite_index = spr_dive
            if (!inbackground)
                vsp = 10
            else
                vsp = 5
        }
        else
        {
            spinspeedmax = movespeed * xscale
            state = states.spin
            movespeed *= xscale
            sprite_index = spr_playerN_tornado
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_divekickstart)
        sprite_index = spr_machroll
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machroll2land)
        sprite_index = spr_machroll2
    if (sprite_index == spr_player_Sjumpcancel && grounded)
        sprite_index = spr_player_Sjumpcancelland
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancelland)
        sprite_index = spr_player_Sjumpcancelslide
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdance)
    {
        particle_set_scale(5, xscale, 1)
        create_particle(x, y, 5, 0)
        movespeed = 12
        sprite_index = spr_breakdancesuper
    }
    if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_tumble
        movespeed = 14
    }
    if (((place_meeting((x + xscale), y, obj_solid) || scr_solid_slope((x + xscale), y)) && (!(place_meeting((x + hsp), y, obj_rollblock))) && ((!(place_meeting((x + hsp), y, obj_rattumble))) || sprite_index != spr_tumble) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || place_meeting(x, y, obj_timedgate))
    {
        if (character != "V")
        {
            hsp = 0
            movespeed = 0
        }
    }
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if ((!key_jump2) && vsp < 0 && (sprite_index == spr_jumpdive1 || sprite_index == spr_jumpdive2))
    {
        vsp /= 15
        jumpstop = 1
    }
    if (grounded && sprite_index == spr_crouchslip && key_jump)
    {
        if (character == "P" && slidetojumpbuffer <= 0)
        {
            scr_soundeffect(sfx_jump)
            sprite_index = spr_jumpdive1
            if (movespeed < 12)
                movespeed += (movespeed / 8)
            image_index = 0
            particle_set_scale(4, xscale, 1)
            create_particle(x, y, 4, 0)
            if (!inbackground)
                vsp = -11
            else
                vsp = -5.5
            jumpAnim = 1
            jumpstop = 0
            if place_meeting(x, (y + 1), obj_railparent)
                railmomentum = 1
            freefallstart = 0
        }
        else if (character == "N" && (!key_slap))
        {
            scr_soundeffect(sfx_jump)
            sprite_index = spr_playerN_sjumpcancelstart
            movespeed += 1
            image_index = 0
            image_speed = 0.3
            particle_set_scale(4, xscale, 1)
            create_particle(x, y, 4, 0)
            vsp = -10
            state = states.skatespin
        }
    }
    if (sprite_index == spr_playerV_divekickstart)
        image_speed = 0.5
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_jumpdive1)
        sprite_index = spr_jumpdive2
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_sjumpcancelstart)
        sprite_index = spr_playerN_sjumpcancelspin
    if (grounded && vsp > 0 && (!(place_meeting(x, y, obj_bigcheese))))
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && hsp != 0 && sprite_index == spr_tumble)
    {
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        vsp = -11
        image_index = 0
    }
    if (crouchslipbuffer > 0)
        crouchslipbuffer--
    if ((!key_down) && key_attack && grounded && sprite_index != spr_tumble && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance)
    {
        if (crouchslipbuffer == 0)
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            if (movespeed >= 12)
            {
                if (character != "D")
                    state = states.mach3
                else
                    state = states.pogo
            }
            else
                state = states.mach2
            image_index = 0
            sprite_index = spr_rollgetup
        }
    }
    if ((!key_down) && (!key_attack) && grounded && sprite_index != spr_tumble && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance)
    {
        if (crouchslipbuffer == 0)
        {
            if (movespeed > 6)
            {
                state = states.machslide
                sprite_index = spr_machslidestart
                scr_soundeffect(sfx_break)
                image_index = 0
            }
            else if (sprite_index != spr_playerN_tornado && sprite_index != spr_playerN_tornado_air)
                state = states.normal
        }
    }
    if (character == "N" && sprite_index == spr_machroll && key_jump2)
    {
        scr_soundeffect(sfx_jump)
        sprite_index = spr_playerN_sjumpcancelstart
        if (movespeed < 12)
            movespeed += (movespeed / 16)
        image_index = 0
        particle_set_scale(4, xscale, 1)
        create_particle(x, y, 4, 0)
        vsp = -10
        state = states.mach2
    }
    if ((!grounded) && place_meeting((x + hsp), y, obj_solid) && (sprite_index == spr_jumpdive1 || sprite_index == spr_jumpdive2))
    {
        wallspeed = movespeed
        if (vsp > 0)
            wallspeed -= vsp
        state = states.climbwall
    }
    if (character == "V" && place_meeting((x + xscale), y, obj_solid))
    {
        xscale = (-xscale)
        scr_soundeffect(sfx_bumpwall)
        instance_create((x - 32), (y + 32), obj_bumpeffect)
    }
    if (sprite_index == spr_player_Sjumpcancelslide || sprite_index == spr_breakdancesuper || sprite_index == spr_machroll || sprite_index == spr_tumble || sprite_index == spr_tumblestart || sprite_index == spr_machroll || sprite_index == spr_faceplantslide)
        image_speed = abs(movespeed) / 15
    else if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancel)
        image_speed = 0
    else
        image_speed = 0.35
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if (scr_slope() && hsp != 0)
        scr_player_addslopemomentum(0.2, 0.4, 14)
    return;
}

