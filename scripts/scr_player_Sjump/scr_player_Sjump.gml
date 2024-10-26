function scr_player_Sjump() //gml_Script_scr_player_Sjump
{
    move = key_right + key_left
    if (move != 0)
        xscale = move
    image_xscale = 1
    hsp = 0
    mach2 = 0
    reboundvsp += 0.025
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    if (character == "S")
    {
        vsp -= 0.5
        if (vsp > -20)
            vsp -= 0.5
        if (key_slap2 || key_attack2)
        {
            sprite_index = spr_playerS_secondjump
            vsp = -8
            movespeed = 15
            state = states.mach2
        }
    }
    if ((!instance_exists(obj_crazyrunothereffect)) && sprite_index != spr_Sjumpcancelstart)
    {
        with (instance_create((x + 12), y, obj_crazyrunothereffect))
        {
            image_angle = -90
            image_speed = 0.3
        }
    }
    if ((key_slap2 || key_attack2) && character == "N")
    {
        image_index = 0
        sprite_index = spr_playerN_sjumpcancelstart
        state = states.mach2
        if (!inbackground)
            vsp = -7
        else
            vsp = -3.5
        movespeed = 14
        if (!instance_exists(obj_crazyrunothereffect))
        {
            with (instance_create((x + 12), y, obj_crazyrunothereffect))
                image_speed = 0.55
        }
    }
    if (floor(image_index) == 2)
    {
        if (sprite_index == spr_player_superjumpintro)
            sprite_index = spr_superjump
    }
    if ((sprite_index == spr_superjump || sprite_index == spr_superspringplayer || sprite_index == spr_player_superjumpintro) && (character == "N" || character == "P"))
    {
        if (!inbackground)
            vsp = sjumpvsp
        else
            vsp = sjumpvsp / 2
    }
    sjumpvsp -= 0.1
    if (sprite_index == spr_player_supersidejump)
    {
        if (a < 25)
            a++
        hsp = xscale * a
        vsp = 0
    }
    if (scr_solid(x, (y + 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && sprite_index == spr_playerN_jetpackboostdown)
    {
        scr_soundeffect(sfx_groundpound)
        scr_soundeffect(sfx_explosion)
        sprite_index = spr_bombpepend
        image_index = 0
        state = states.Sjumpland
        image_speed = 0.4
        instance_create(x, y, obj_playerexplosion)
    }
    if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && sprite_index != spr_playerN_jetpackboostdown && sprite_index != spr_Sjumpcancelstart)
    {
        pizzapepper = 0
        a = 0
        if (sprite_index == spr_player_supersidejump)
            sprite_index = spr_player_supersidejumpland
        if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer || sprite_index == spr_player_superjumpintro || character == "V")
            sprite_index = spr_superjumpland
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = 30 / room_speed
        }
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
            {
                image_index = 0
                if grounded
                    vsp = -7
            }
        }
        scr_soundeffect(sfx_groundpound)
        image_index = 0
        state = states.Sjumpland
        machhitAnim = 0
    }
    else if ((key_slap2 || key_attack2) && character == "P" && sprite_index != spr_superspringplayer && sprite_index != spr_Sjumpcancelstart)
    {
        image_index = 0
        sprite_index = spr_Sjumpcancelstart
        if (!inbackground)
            vsp = -8
        else
            vsp = -4
        if (!ispeppino)
        {
            image_index = 0
            sprite_index = spr_playerN_sjumpcancelstart
            audio_stop_sound(sfx_mach2N)
            scr_soundeffect(sfx_mach2N)
            state = states.skatespin
            if (!inbackground)
                vsp = -4
            else
                vsp = -2
            movespeed = 12
            if ((!instance_exists(obj_crazyrunothereffect)) && sprite_index != spr_Sjumpcancelstart)
            {
                with (instance_create((x + 12), y, obj_crazyrunothereffect))
                    image_speed = 0.55
            }
            sjumpcancel = audio_play_sound(sfx_stompenemy, 5, false)
            sfx_gain(sjumpcancel)
        }
        else
        {
            sjumpcancel = audio_play_sound(sfx_sjumpcancel, 5, false)
            sfx_gain(sjumpcancel)
        }
    }
    if (sprite_index == spr_Sjumpcancelstart)
    {
        if (vsp < 0)
            vsp += 0.2
        if (move != 0)
            xscale = move
        if (floor(image_index) == (image_number - 1))
        {
            if (!inbackground)
                vsp = -6
            else
                vsp = -3
            movespeed = 13 + reboundvsp
            image_index = 0
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
            sprite_index = spr_Sjumpcancel
            if ((!instance_exists(obj_crazyrunothereffect)) && sprite_index != spr_Sjumpcancelstart)
            {
                with (instance_create((x + 12), y, obj_crazyrunothereffect))
                    image_speed = 0.3
            }
            state = states.mach3
            reboundvsp = 0
            with (instance_create(x, y, obj_crazyruneffect))
                image_xscale = other.xscale
        }
    }
    if (character == "N" && sprite_index != spr_superspringplayer)
    {
        if (move == 1)
            hsp = 3
        if (move == -1)
            hsp = -3
    }
    if (character == "S" && sprite_index != spr_superspringplayer)
    {
        if (move == 1)
            hsp = 5
        if (move == -1)
            hsp = -5
    }
    if (character == "D" && sprite_index != spr_superspringplayer)
    {
        if (move == 1)
            hsp = 4
        if (move == -1)
            hsp = -4
        if (sprite_index != spr_playerN_jetpackboostdown)
            vsp = -16
        else
            vsp = 18
        if key_attack2
        {
            if (move != 0)
                xscale = move
            scr_soundeffect(sfx_noisewoah)
            scr_soundeffect(sfx_sjumprepN)
            sprite_index = spr_playerN_jetpackstart
            image_index = 0
            hsp /= 2
            vsp = 0
            state = states.Sjumpprep
        }
    }
    if (character == "V" && floor(image_index) == (image_number - 1) && sprite_index != spr_playerV_sjumphold)
    {
        state = states.jump
        sprite_index = spr_playerV_fall
    }
    if (sprite_index == spr_superjump)
        image_speed = 0.1 + (-vsp) / 35
    else
        image_speed = 0.5
    if (sprite_index == spr_playerV_sjumphold)
    {
        if (!inbackground)
            vsp = -13
        else
            vsp = -6.5
    }
    scr_collision()
    if (character == "M")
    {
        if (vsp > -20)
            vsp -= 0.6
        if (key_jump2 && pepperwall == 1)
        {
            if (move != 0)
                xscale = move
            state = states.shoulderbash
            sprite_index = spr_pepperman_rolling
            movespeed = 12
            image_index = 0
            scr_soundeffect(sfx_suplexdash)
        }
        if (key_attack2 && pepperwall == 0)
        {
            if (move != 0)
                xscale = move
            state = states.shoulderbash
            sprite_index = spr_pepperman_rolling
            movespeed = 12
            image_index = 0
            scr_soundeffect(sfx_suplexdash)
        }
        if (((!key_attack) || (!(place_meeting((x + xscale), y, obj_solid)))) && pepperwall == 1)
        {
            state = states.jump
            sprite_index = spr_pepperman_fall
        }
    }
    return;
}

