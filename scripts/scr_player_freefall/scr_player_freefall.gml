function scr_player_freefall() //gml_Script_scr_player_freefall
{
    pepperwall = 0
    if (character == "M" && vsp < 50)
    {
        if (!inbackground)
            vsp += 0.3
        else
            vsp += 0.15
    }
    if (vsp > 60)
        vsp = 60
    reboundvsp += 0.05
    if key_jump
        climbbuffer = 5
    if (climbbuffer > 0)
        climbbuffer--
    landAnim = 1
    if (vsp >= 2)
    {
        if (!inbackground)
            vsp += 0.5
        else
            vsp += 0.25
    }
    if (character == "NE" || hyperpeppino == 1)
    {
        if (!inbackground)
            vsp += 0.1
        else
            vsp += 0.05
    }
    if (character == "S" && vsp < 18)
        vsp += 3
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_pepperman_groundpoundstart)
        sprite_index = spr_bodyslamfall
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_bodyslamstart)
    {
        sprite_index = spr_bodyslamfall
        if (vsp < 9)
            vsp = 9
    }
    if (sprite_index == spr_bodyslamfall && vsp < 15)
        vsp += 0.5
    if (floor(image_index) == (image_number - 1) && sprite_index == Spr_playerN_crusherstart)
        sprite_index = spr_playerN_crusherloop
    move = key_left + key_right
    if (!grounded)
    {
        if (sprite_index != spr_rockethitwall)
            hsp = move * movespeed
        else
            hsp = 0
        if (move != xscale && momemtum == 1 && movespeed != 0)
            movespeed -= 0.05
        if (movespeed == 0)
            momemtum = 0
        if ((move == 0 && momemtum == 0) || scr_solid((x + hsp), y))
        {
            movespeed = 0
            mach2 = 0
        }
        if (move != 0 && movespeed < 7)
            movespeed += 0.25
        if (movespeed > 7)
            movespeed -= 0.05
        if ((scr_solid((x + 1), y) && move == 1 && momemtum == 0) || (scr_solid((x - 1), y) && move == -1 && momemtum == 0))
            movespeed = 0
        if (dir != xscale && momemtum == 0)
        {
            mach2 = 0
            dir = xscale
            movespeed = 0
        }
        if (move == (-xscale) && momemtum == 0)
        {
            mach2 = 0
            movespeed = 0
            momemtum = 0
        }
        if (move != 0)
            xscale = move
    }
    if (sprite_index == Spr_playerN_crusherstart || sprite_index == spr_playerN_crusherloop)
    {
        if (punch_afterimage > 0)
            punch_afterimage--
        else
        {
            punch_afterimage = 5
            create_blue_afterimage(x, y, sprite_index, image_index, xscale)
        }
        if (key_attack2 || key_slap2)
        {
            state = states.mach2
            sprite_index = spr_playerN_sjumpcancelstart
            scr_soundeffect(sfx_sjumpcancel)
            vsp = -7
            movespeed = 13
            image_index = 0
        }
    }
    if (vsp > 0)
        freefallsmash += 0.85
    else if (vsp < -1)
        freefallsmash = -7
    if (freefallsmash >= 10 && sprite_index != spr_mach2jump && (!instance_exists(superslameffectid)))
    {
        with (instance_create(x, y, obj_superslameffect))
        {
            playerid = other.object_index
            other.superslameffectid = id
        }
    }
    if (grounded && (freefallsmash < 10 || (!(place_meeting(x, (y + vsp), obj_metalblock)))) && (!(place_meeting(x, (y + vsp), obj_destructibles))))
    {
        if scr_slope()
        {
            with (instance_place(x, (y + 1), obj_slope))
            {
                other.xscale = (-sign(image_xscale))
                other.movespeed = (other.freefallsmash + 14) / 3
                if (other.character == "M")
                {
                    other.state = states.machroll
                    other.sprite_index = spr_pepperman_rolling
                }
                else
                {
                    other.state = states.tumble
                    other.sprite_index = other.spr_crouchslip
                }
                with (instance_create(other.x, other.y, obj_jumpdust))
                    image_xscale = (-other.image_xscale)
                if (other.movespeed > 20)
                    other.movespeed = 20
            }
        }
        else
        {
            tauntstoredmovespeed = movespeed
            if (sprite_index == spr_playerN_crusherloop)
                sprite_index = spr_playerN_crusherland
            scr_soundeffect(sfx_groundpound)
            if (sprite_index == spr_player_groundpoundcancel1)
                sprite_index = spr_player_groundpoundcancel2
            else if (shotgunAnim == 0)
            {
                if (character != "P")
                    sprite_index = spr_bodyslamland
                else
                    sprite_index = choose(spr_bodyslamland, spr_player_bodyslamland2)
            }
            else
                sprite_index = spr_shotgunjump2
            image_index = 0
            with (obj_meatball)
            {
                if place_meeting(x, (y + 40), obj_solid)
                {
                    y -= 5
                    vsp = -11
                    rolling = 1
                    sprite_index = spr_meatball_dead
                }
            }
            state = states.freefallland
            jumpAnim = 1
            jumpstop = 0
            with (obj_camera)
            {
                shake_mag = 5
                shake_mag_acc = 15 / room_speed
            }
            if (freefallsmash >= 10)
            {
                with (obj_baddie)
                {
                    if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && (!invincible) && groundpound)
                    {
                        state = states.stun
                        if (stunned < 60)
                            stunned = 60
                        vsp = -11
                        image_xscale *= -1
                        hsp = 0
                        momemtum = 0
                    }
                }
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = 30 / room_speed
                }
                combo = 0
                bounce = 0
            }
            create_particle(x, (y + 3), 14, 0)
            freefallstart = 0
        }
    }
    image_speed = 0.35
    if (sprite_index == spr_bodyslamstart)
        image_speed = 0.4
    if (sprite_index == spr_playerN_noisebombspinjump && image_index < 6)
        sprite_index = spr_playerN_jetpackboostdown
    if (key_slap2 && character == "P" && sprite_index != spr_superspringplayer && sprite_index != spr_freefallcancelstart && vsp > 1)
    {
        image_index = 0
        sprite_index = spr_freefallcancelstart
        sjumpcancel = audio_play_sound(sfx_sjumpcancel, 5, false)
        sfx_gain(sjumpcancel)
        instance_destroy(obj_superslameffect)
    }
    if (key_attack2 && character == "M" && sprite_index != spr_superspringplayer && sprite_index != spr_freefallcancelstart && sprite_index != spr_pepperman_groundpoundstart && vsp > 5)
    {
        image_index = 0
        sprite_index = spr_pepperman_rolling
        state = states.shoulderbash
        movespeed = 12
        vsp = -2
        instance_destroy(obj_superslameffect)
        sjumpcancel = audio_play_sound(sfx_sjumpcancel, 5, false)
        sfx_gain(sjumpcancel)
    }
    if (sprite_index == spr_freefallcancelstart)
    {
        image_speed = 0.4
        canceldiving = 1
        vsp /= 3
        hsp /= 4
        if (move != 0)
            xscale = move
        if (floor(image_index) == (image_number - 1))
        {
            vsp = 1
            movespeed = 12
            image_index = 0
            reboundvsp = 0
            sprite_index = spr_freefallcancel
            wallspeed = 0
            state = states.mach3
            with (instance_create(x, y, obj_crazyruneffect))
                image_xscale = other.xscale
        }
    }
    if (sprite_index == spr_player_shotgunjump2 && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_shotgunjump3
    return;
}

