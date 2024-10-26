function state_player_jump() //gml_Script_state_player_jump
{
    reboundvsp = 0
    pepperwall = 0
    pogospeed = movespeed
    attacksleft = 2
    audio_stop_sound(sfx_tornado)
    audio_stop_sound(sfx_tornadoair)
    if (facehurt == 1 && sprite_index != spr_highjump)
        sprite_index = spr_machfreefall
    if (key_shoot2 && character == "P" && blackbelt == 1)
    {
        state = states.blackbelt
        if (move != 0)
            movespeed = 12 * xscale
        else
            movespeed = 5 * dir
        landAnim = 0
        sprite_index = choose(spr_player_kungfuair1transition, spr_player_kungfuair2transition, spr_player_kungfuair3transition)
        scr_soundeffect(sfx_suplexdash)
        image_index = 0
    }
    if (sprite_index == spr_taunt)
    {
        if (movespeed == 0)
            sprite_index = spr_fall
    }
    if (sprite_index == spr_highjump)
        facehurt = 0
    if (key_slap2 && key_up && (!key_down2) && character != "NE" && character != "V")
    {
        state = states.punch
        image_index = 0
        movespeed *= xscale
        sprite_index = spr_uppercut
        flash = 1
        if (character == "P")
        {
            if (!inbackground)
                vsp = -10
            else
                vsp = -5
        }
        else if (!inbackground)
            vsp = -18
        else
            vsp = -9
        uppercut = audio_play_sound(sfx_uppercut, 1, false)
        sfx_gain(uppercut)
        particle_set_scale(4, xscale, 1)
        create_particle(x, y, 4, 0)
    }
    if (sprite_index == spr_highjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_fall
    if (sprite_index == spr_player_hurtjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_hurtfall
    if (sprite_index == spr_player_hanstandjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_jump2
    if ((sprite_index == spr_playerV_bootsjump || sprite_index == spr_playerV_bootsfall) && movespeed < 12)
        movespeed += 0.25
    if (pizzapepper == 1 && key_jump2)
    {
        sprite_index = spr_player_airbash
        if (!instance_exists(obj_spinhitbox))
            instance_create(x, y, obj_spinhitbox)
        if (vsp > -11)
            vsp += -0.6
        if (vsp > -3)
            vsp += -0.6
    }
    landAnim = 1
    if (!momemtum)
        hsp = move * movespeed
    else
        hsp = xscale * movespeed
    hsp += (railmovespeed * raildir)
    if key_taunt2
    {
        input_finisher_buffer = 60
        input_attack_buffer = 0
        input_up_buffer = 0
        input_down_buffefr = 0
    }
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    if (move != xscale)
        movespeed = 2
    move = key_left + key_right
    if (movespeed == 0)
        momemtum = 0
    if scr_solid((x + hsp), y)
    {
        movespeed = 0
        mach2 = 0
    }
    if (move != 0)
    {
        if (sprite_index != spr_playerN_wallclingstart)
            xscale = move
        if (movespeed < 8 && isswimming == false)
            movespeed += 0.5
        else if (floor(movespeed) == 8)
            movespeed = 8
        if (movespeed < 3 && move != 0)
            image_speed = 0.35
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
        if (isswimming == true)
        {
            if (movespeed > 6)
                movespeed -= 2
            if (vsp < 0)
                movespeed -= 0.01
            image_speed /= 2
        }
        if (scr_solid((x + xscale), y) && move == xscale)
            movespeed = 0
    }
    else
        movespeed = 0
    if (sprite_index == spr_playerN_smallspin && (!key_jump2) && vsp < 0.5)
        vsp /= 15
    if (movespeed > 8 && sprite_index != spr_playerN_walljump && isswimming == false)
        movespeed -= 0.1
    if (ladderbuffer > 0)
        ladderbuffer--
    if (!jumpstop)
    {
        if ((!key_jump2) && vsp < 0.5 && (!stompAnim) && facehurt == 0)
        {
            if (NEsjump == 0)
                vsp /= 15
            jumpstop = 1
        }
        else if (scr_solid(x, (y - 1)) && (!jumpAnim))
        {
            vsp = grav
            jumpstop = 1
        }
    }
    if (global.mort && (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart))
    {
        if (vsp > 6)
            vsp = 6
        if (!key_jump2)
        {
            grav = 0.5
            sprite_index = spr_fall
        }
    }
    if key_jump
    {
        if (global.mort && sprite_index != spr_mortdoublejump)
        {
            repeat (6)
                create_debris(x, y, spr_feather)
            scr_soundeffect(sfx_woosh)
            sprite_index = spr_mortdoublejump
            image_index = 0
            jumpstop = 0
            grav = 0.25
            mort = 1
        }
    }
    if (sprite_index == spr_playerN_wallclingstart)
    {
        vsp /= 1.5
        hsp = 0
        image_speed = 0.4
        if (floor(image_index) == (image_number - 1))
        {
            vsp = -15
            doublejump = 0
            image_index = 0
            sprite_index = spr_playerN_smallspin
            jumpAnim = 1
        }
    }
    if (character == "D" && place_meeting((x + xscale), y, obj_solid) && key_jump && sprite_index != spr_playerN_wallclingstart)
    {
        sprite_index = spr_playerN_wallclingstart
        image_index = 0
    }
    if grounded
    {
        if (input_buffer_jump < 8 && (!key_down) && (!key_attack) && vsp > 0 && (!((sprite_index == spr_facestomp || sprite_index == spr_freefall))))
        {
            scr_soundeffect(sfx_jump)
            stompAnim = 0
            if (!inbackground)
                vsp = -11
            else
                vsp = -5.5
            state = states.jump
            jumpAnim = 1
            jumpstop = 0
            freefallstart = 0
            railmomentum = 0
            if place_meeting(x, (y + 1), obj_railparent)
                railmomentum = 1
            if (sprite_index != spr_shotgunshoot)
            {
                sprite_index = spr_jump
                if shotgunAnim
                    sprite_index = spr_shotgunjump
                image_index = 0
            }
            particle_set_scale(4, xscale, 1)
            create_particle(x, y, 4, 0)
        }
        if (vsp > 0 || sprite_index == spr_suplexbump)
        {
            scr_soundeffect(sfx_step)
            if (key_attack || sprite_index == spr_shotgunshoot)
                landAnim = 0
            if (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
                sprite_index = spr_player_mortland
            if (sprite_index != spr_shotgunshoot)
                image_index = 0
            input_buffer_secondjump = 0
            state = states.normal
            jumpAnim = 1
            jumpstop = 0
            freefallstart = 0
            create_particle(x, y, 12, 0)
        }
    }
    if key_jump
        input_buffer_jump = 0
    if (vsp > 5 && sprite_index != spr_mortdoublejump)
        fallinganimation++
    if (fallinganimation >= 40 && fallinganimation < 80)
        sprite_index = spr_facestomp
    else if (fallinganimation >= 80)
        sprite_index = spr_freefall
    if (!stompAnim)
    {
        if (!jumpAnim)
        {
            switch sprite_index
            {
                case spr_mortdoublejumpstart:
                    sprite_index = spr_mortdoublejump
                    break
                case spr_playerN_doublejump:
                    sprite_index = spr_playerN_doublejumpfall
                    break
                case spr_airdash1:
                    sprite_index = spr_airdash2
                    break
                case spr_shotgunjump:
                    sprite_index = spr_shotgunfall
                    break
                case spr_playerV_superjump:
                    sprite_index = spr_playerV_fall
                    break
                case spr_jump:
                case spr_playerN_smallspin:
                    sprite_index = spr_fall
                    break
                case spr_suplexcancel:
                    sprite_index = spr_fall
                    break
                case spr_player_backflip:
                    sprite_index = spr_fall
                    break
                case spr_player_Sjumpstart:
                    sprite_index = spr_player_Sjump
                    break
                case spr_player_shotgunjump1:
                    sprite_index = spr_player_shotgunjump2
                    break
                case spr_shotgun_shootair:
                    sprite_index = spr_shotgunfall
                    break
                case spr_shotgunshoot:
                    sprite_index = spr_shotgunfall
                    break
                case spr_stompprep:
                    sprite_index = spr_stomp
                    break
                case spr_player_groundpoundjump:
                    sprite_index = spr_fall
                    break
                case spr_player_pistoljump1:
                    sprite_index = spr_player_pistoljump2
                    break
            }

        }
    }
    else if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
        sprite_index = spr_stomp
    if (key_down2 && (!global.kungfu) && character != "NE")
    {
        input_buffer_slap = 8
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart
            audio_stop_sound(sfx_groundpoundstart)
            scr_soundeffect(sfx_groundpoundstart)
            image_index = 0
            state = states.freefall
            if (vsp < 0)
            {
                if (!inbackground)
                    vsp = -3 + vsp / 2
                else
                    vsp = -6 + vsp / 2
            }
            else if (!inbackground)
                vsp = -4
        }
        else
        {
            scr_soundeffect(sfx_killingblow)
            sprite_index = spr_shotgunjump1
            image_index = 0
            state = states.freefall
            if (!inbackground)
                vsp = -11
            else
                vsp = -5.5
            with (instance_create((x + xscale * 30), (y + 60), obj_shotgunbullet))
            {
                image_xscale = other.xscale
                sprite_index = sprite10391
                spdh = -10
                spd = 0
                shotgun = 1
            }
            with (instance_create((x + xscale * 30), (y + 60), obj_shotgunbullet))
            {
                image_xscale = other.xscale
                sprite_index = sprite10391
                spdh = -10
                spd = 5
                shotgun = 1
            }
            with (instance_create((x + xscale * 30), (y + 60), obj_shotgunbullet))
            {
                image_xscale = other.xscale
                sprite_index = sprite10391
                spdh = -10
                spd = -5
                shotgun = 1
            }
        }
    }
    if (sprite_index == spr_player_suplexcancel)
        image_speed = 0.4
    else
        image_speed = 0.35
    if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
    {
        scr_soundeffect(sfx_groundpound)
        image_index = 0
        if (character == "P")
            sprite_index = spr_player_freefallland
        else
            sprite_index = spr_bodyslamland
        state = states.freefallland
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
            {
                vsp = -7
                hsp = 0
            }
        }
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = 30 / room_speed
        }
    }
    if (key_slap2 && character == "D" && (!key_up))
    {
        state = 276
        scr_soundeffect(sfx_Nspin)
        if (move != 0 && movespeed < 12)
            movespeed += 3
        if (move == 0)
            movespeed = 9
        image_index = 0
    }
    if (key_slap2 && sprite_index != spr_suplexbump && pistolAnim == 0 && (!key_up) && (!key_down) && character != "V" && character != "NE" && character != "D")
    {
        image_index = 0
        sprite_index = spr_suplexdashjumpstart
        flash = 1
        suplexmove = 1
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
        sfx_gain(suplexdashsnd)
        if ((!instance_exists(obj_crazyrunothereffect)) && sprite_index != spr_Sjumpcancelstart)
        {
            with (instance_create((x + 12), y, obj_crazyrunothereffect))
                image_speed = 0.55
        }
        state = states.handstandjump
        if (isswimming == false)
            movespeed = 5
        else if (movespeed < 2)
            movespeed = 2
    }
    if (key_shoot2 && shotgunAnim)
        scr_shotgunshoot()
    if (key_slap2 && shoot)
    {
        if (!shotgunAnim)
        {
            flash = 1
            if ((!instance_exists(parry_inst)) && flash == 1)
            {
                parry_inst = instance_create(x, y, obj_parryhitbox)
                var _playerid = obj_gamestarter
                if (object_index == obj_player2)
                    _playerid = obj_hoop
                with (parry_inst)
                {
                    player_id = _playerid
                    image_xscale = other.xscale
                }
            }
            if global.mort
            {
                with (instance_create((x + xscale * 20), y, obj_shotgunbullet))
                {
                    image_xscale = other.xscale
                    sprite_index = spr_mortprojectile
                }
                sprite_index = spr_mortthrow
                image_index = 0
                state = states.pistol
                mort = 1
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag_acc = 3 / room_speed
                }
            }
            else if (character != "V" && shoot)
            {
                sprite_index = spr_pistolshot
                image_index = 0
                movespeed = 5
                state = states.handstandjump
                shoot = 1
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag = 3 / room_speed
                }
                if ispeppino
                {
                    with (instance_create((x + xscale * 20), y, obj_shotgunbullet))
                    {
                        pistol = 1
                        sprite_index = spr_peppinobullet
                        image_xscale = other.xscale
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_playerbomb))
                    {
                        kick = 1
                        movespeed = 15
                        image_xscale = other.xscale
                    }
                }
            }
            else if (character != "V")
            {
            }
        }
    }
    if (key_jump && character == "D" && doublejump == 0 && (!(place_meeting((x + xscale), y, obj_solid))))
    {
        doublejump = 1
        jumpAnim = 1
        scr_soundeffect(sfx_woosh)
        vsp = -11
        sprite_index = spr_playerN_doublejump
        image_index = 0
    }
    switch character
    {
        case "D":
            if (key_attack2 && (pogochargeactive || pizzapepper > 0))
            {
                scr_soundeffect(sfx_noisewoah)
                scr_soundeffect(sfx_sjumprepN)
                if (!key_up)
                    sprite_index = spr_playerN_jetpackstart
                else
                    sprite_index = spr_superjumpprep
                image_index = 0
                hsp /= 2
                vsp = 0
                state = states.Sjumpprep
            }
            if (key_attack && (!pogochargeactive) && (!key_slap2) && pizzapepper == 0)
            {
                sprite_index = spr_playerN_pogostart
                image_index = 0
                state = states.pogo
            }
            if (key_attack && grounded && fallinganimation < 40)
            {
                sprite_index = spr_mach1
                image_index = 0
                state = states.mach2
                if (movespeed < 6)
                    movespeed = 6
            }
            if (character == "N" && keyboard_check_pressed(ord("H")) && hypernoise == 0 && global.stylemultiplier > 0.5)
            {
                if (hypernoise == 0)
                {
                    hypernoise = 1
                    scr_soundeffect(sfx_transform)
                    global.superactive = 1
                }
                state = states.hypersoar
                flash = 1
                alarm[0] = 1
                if (xscale == -1)
                    movespeed = (-movespeed)
                sprite_index = spr_playerN_phase3intro2
                image_index = 0
            }
            if (key_jump && hypernoise == 1 && character == "N")
            {
                state = states.hypersoar
                image_index = 0
                if (xscale == -1)
                    movespeed = (-movespeed)
            }
            if (key_jump && key_up && character == "N")
            {
                sprite_index = Spr_playerN_crusherstart
                scr_soundeffect(sfx_crusherstart)
                image_index = 0
                state = states.freefall
                vsp = -15
                momemtum = 1
            }
            break
        case "P":
        case "N":
            if (key_attack && grounded && fallinganimation < 40)
            {
                sprite_index = spr_mach1
                image_index = 0
                state = states.mach2
                if (movespeed < 6)
                    movespeed = 6
            }
            if (character == "N" && keyboard_check_pressed(ord("H")) && hypernoise == 0 && global.stylemultiplier > 0.5)
            {
                if (hypernoise == 0)
                {
                    hypernoise = 1
                    scr_soundeffect(sfx_transform)
                    global.superactive = 1
                }
                state = states.hypersoar
                flash = 1
                alarm[0] = 1
                if (xscale == -1)
                    movespeed = (-movespeed)
                sprite_index = spr_playerN_phase3intro2
                image_index = 0
            }
            if (key_jump && hypernoise == 1 && character == "N")
            {
                state = states.hypersoar
                image_index = 0
                if (xscale == -1)
                    movespeed = (-movespeed)
            }
            if (key_jump && key_up && character == "N")
            {
                sprite_index = Spr_playerN_crusherstart
                scr_soundeffect(sfx_crusherstart)
                image_index = 0
                state = states.freefall
                vsp = -15
                momemtum = 1
            }
            break
        case "V":
            if (key_attack && (((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope))))
            {
                if (!key_down)
                {
                    wallspeed = (-vsp)
                    state = states.climbwall
                }
                else
                {
                    wallspeed = -8
                    state = states.climbwall
                }
            }
            if (key_attack && grounded && fallinganimation < 40)
            {
                jumpAnim = 1
                if (pizzapepper == 0)
                {
                    sprite_index = spr_mach1
                    image_index = 0
                    movespeed = 6
                    state = states.mach1
                }
                else
                {
                    sprite_index = spr_crazyrun
                    movespeed = 20
                    state = states.mach3
                }
            }
            if (key_shoot2 && (!instance_exists(dynamite_inst)))
            {
                sprite_index = spr_playerV_dynamitethrow
                image_index = 0
                if (move == 0 && sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfu3)
                    movespeed = 0
                state = states.dynamite
                with (instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale
                    other.dynamite_inst = id
                    playerid = other.id
                    movespeed = 6
                    vsp = -6
                }
            }
            if (sprite_index == spr_playerV_superjump && floor(image_index) == (image_number - 1))
                create_particle(x, (y + 25), 7, 0)
            if key_slap2
            {
                sprite_index = spr_playerV_airrevolver
                image_index = 0
                vsp = -7
                state = states.revolver
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
            break
        case "NE":
            if (key_jump && NEdoublejump == 0)
            {
                NEdoublejump = 1
                vsp = -9
            }
            if (key_jump2 && NEdoublejump == 1)
            {
                sprite_index = spr_noisettestick_helicopter
                if (vsp > 0)
                    vsp -= 0.4
                if (vsp > 15)
                    vsp = 15
            }
            if (NEsjump == 1)
            {
                if key_jump
                {
                    NEsjump = 0
                    NEdoublejump = 0
                    sprite_index = spr_fall
                }
                sprite_index = spr_noisettestick_helicopter
                if (vsp > 0)
                    vsp -= 0.4
                if (vsp > -10)
                    vsp = -10
                if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
                {
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
                    NEsjump = 0
                    scr_soundeffect(sfx_groundpound)
                    image_index = 0
                    state = states.Sjumpland
                    machhitAnim = 0
                }
            }
            if key_down2
            {
                input_buffer_slap = 8
                sprite_index = spr_bodyslamstart
                audio_stop_sound(sfx_groundpoundstart)
                scr_soundeffect(sfx_groundpoundstart)
                image_index = 0
                state = states.freefall
                if (!inbackground)
                    vsp = -10 + vsp / 2
                else
                    vsp = -5 + vsp / 2
            }
            break
    }

    if ((!key_attack) || move != xscale)
        mach2 = 0
    if (floor(image_index) == (image_number - 1))
        jumpAnim = 0
    scr_dotaunt()
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0
        machslideAnim = 0
        image_speed = 0.45
        if (image_index > (image_number - 1))
            sprite_index = spr_shotgunfall
    }
    if (place_meeting(x, y, obj_solid) && (!inbg) && sprite_index != spr_playerN_tornado)
    {
        state = states.crouch
        landAnim = 0
        crouchAnim = 1
        image_index = 0
        idle = 0
    }
    return;
}

function state_pepperman_jump() //gml_Script_state_pepperman_jump
{
    pepperman_grab_reset()
    move = key_left + key_right
    if (move != 0)
    {
        xscale = move
        if (movespeed < 8)
            movespeed += 0.2
        if (movespeed > 8)
        {
            if (sprite_index == spr_player_hanstandjump || sprite_index == spr_player_jump2)
                movespeed -= 0.01
            else
                movespeed -= 0.5
        }
    }
    else
    {
        if (movespeed > 0)
            movespeed -= 0.15
        if (movespeed < 0 && sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfu3)
            movespeed = 0
    }
    hsp = xscale * movespeed
    if (sprite_index == spr_jump && floor(image_index) == (image_number - 1))
        sprite_index = spr_fall
    if ((!key_jump2) && vsp < 0.5 && sprite_index != spr_uppercut)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && vsp > 0)
    {
        state = states.normal
        sprite_index = spr_pepperman_land
        instance_create(x, (y - 5), obj_landcloud)
    }
    if (key_down2 && (!grounded))
    {
        state = states.freefall
        freefallsmash = 12
        vsp = 0
        image_index = 0
        sprite_index = spr_pepperman_groundpoundstart
    }
    if (key_attack && ((!(place_meeting((x + xscale), y, obj_solid))) || place_meeting((x + xscale), y, obj_destructibles)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw)
    {
        if (move != 0)
            xscale = move
        state = states.shoulderbash
        sprite_index = spr_pepperman_shoulderstart
        flash = 1
        image_index = 0
        movespeed = 10
        scr_soundeffect(sfx_suplexdash)
    }
    if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_fall
    if key_jump
        input_buffer_jump = 0
    if (ladderbuffer > 0)
        ladderbuffer--
    if key_taunt2
    {
        scr_soundeffect(sfx_taunt)
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredvsp = vsp
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        state = states.tauntmoves
        if (supercharged == 1)
        {
            image_index = 0
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
        }
        else
        {
            taunttimer = 20
            image_index = random_range(0, 11)
            sprite_index = spr_taunt
        }
        with (instance_create(x, y, obj_taunteffect))
            player = other.id
    }
    return;
}

function scr_player_jump() //gml_Script_scr_player_jump
{
    if (character != "M" && character != "S")
        state_player_jump()
    else if (character == "M")
        state_pepperman_jump()
    else if (character == "S")
        state_snick_jump()
    return;
}

function state_snick_jump() //gml_Script_state_snick_jump
{
    image_speed = 0.4
    if ((!key_jump2) && vsp < 0)
        vsp /= 2
    move = key_left + key_right
    hsp = move * movespeed + railmovespeed * raildir
    if (move != 0)
    {
        if (movespeed < 9)
            movespeed += 0.5
        xscale = move
        if (movespeed > 9)
            movespeed -= 0.1
    }
    else
    {
        if (movespeed > 0)
            movespeed -= 0.5
        if (movespeed < 0)
            movespeed = 0
    }
    if grounded
    {
        state = states.normal
        landAnim = 1
        sprite_index = spr_land
    }
    scr_dotaunt()
    if key_down2
    {
        sprite_index = spr_bodyslamstart
        vsp = -9
        audio_stop_sound(sfx_groundpoundstart)
        scr_soundeffect(sfx_groundpoundstart)
        image_index = 0
        state = states.freefallprep
    }
    return;
}

