function state_player_normal() //gml_Script_state_player_normal
{
    longjumpready = 1
    mach4flame = 5
    vspmax = -3
    canceldiving = 0
    attacksleft = 0
    mach2 = 0
    move = key_left + key_right
    skateboarding = 0
    momemtum = 0
    jumpstop = 0
    NEdoublejump = 0
    pepperwall = 0
    if (sprite_index == spr_player_pistolintro)
    {
        hsp = 0
        vsp = 0
    }
    if (key_shoot2 && character == "P" && blackbelt == 1)
    {
        state = states.blackbelt
        if (move != 0)
            movespeed = 12 * xscale
        else
            movespeed = 5
        landAnim = 0
        sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
        scr_soundeffect(sfx_suplexdash)
        image_index = 0
    }
    if (key_shoot2 && character == "P" && dancemaster == 1)
    {
        vsp = -6
        movespeed = 10
        state = states.breakdance
        scr_soundeffect(sfx_breakdance)
        sprite_index = spr_player_breakdancesuper
        image_speed = 0.4
    }
    if (sprite_index == spr_taunt)
    {
        if (movespeed == 0)
            sprite_index = spr_idle
        else
            sprite_index = spr_move
    }
    if (dancecharge > 0 && key_taunt)
        dancecharge--
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    if key_taunt2
    {
        input_finisher_buffer = 60
        input_attack_buffer = 0
        input_up_buffer = 0
        input_down_buffer = 0
    }
    if (key_taunt && dancecharge < 1)
        breakdance_speed = Approach(breakdance_speed, 0.6, 0.005)
    else
        breakdance_speed = 0.25
    if (!key_taunt)
        dancecharge = 30
    if (breakdance_speed >= 0.5)
    {
        if (!instance_exists(obj_beatbox))
        {
            instance_create(x, y, obj_genericpoofeffect)
            with (instance_create(x, y, obj_beatbox))
            {
                if (!inbackground)
                    vsp = -11
                else
                    vsp = -5.5
            }
        }
        notecreate--
    }
    if (notecreate <= 0)
    {
        instance_create((x + (random_range(-70, 70))), (y + (random_range(-70, 70))), obj_notes)
        notecreate = 10
    }
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
        railmomentum = 1
    }
    hsp = move * movespeed + railmovespeed * raildir
    if (move != 0)
    {
        if (sprite_index != spr_player_pistolintro)
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
            if (movespeed < 6)
                movespeed += 0.2
            image_speed /= 2
        }
        if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
        {
            machslideAnim = 0
            idle = 0
            facehurt = 0
            if shoot
                sprite_index = spr_player_pistolwalk
            else if mort
                sprite_index = spr_player_mortwalk
            else if (key_taunt && dancecharge < 1)
                sprite_index = spr_breakdance
            else if (global.minutes == 0 && global.seconds == 0)
                sprite_index = spr_hurtwalk
            else if (global.stylethreshold == 2 || pizzapepper == 1)
                sprite_index = spr_3hpwalk
            else if (global.stylethreshold >= 3 || hyperpeppino == 1)
                sprite_index = spr_ragemove
            else if (character == "P" && isswimming == true)
                sprite_index = spr_player_swimwalk
            else if (pistolAnim == 1 && character == "P")
                sprite_index = spr_player_pistolwalk
            else if (isswimming == false && character != "P")
                sprite_index = spr_move
            else
                sprite_index = spr_move
        }
        if (scr_solid((x + sign(hsp)), y) && (!(scr_solid_slope((x + sign(hsp)), y))) && xscale == move && (!(place_meeting(x, (y + 1), obj_slope))))
            movespeed = 0
        if ((!steppy) && character != "V" && (floor(image_index == 3) || floor(image_index) == 8))
        {
            create_particle(x, (y + 43), 1, 0)
            steppy = 1
        }
        if (floor(image_index) != 3 && floor(image_index) != 8)
            steppy = 0
    }
    else
    {
        if (sprite_index == spr_breakdance)
            image_speed = breakdance_speed
        else
            image_speed = 0.35
        if (character != "D" && sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfu3)
            movespeed = 0
        else if (character == "D")
        {
            if (movespeed > 0)
                movespeed -= 0.25
        }
        if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
        {
            if (idle < 400 && (!key_taunt))
                idle++
            if (idle >= 150 && (!key_taunt))
            {
                if (sprite_index != spr_idle && floor(image_index) == (image_number - 1))
                    facehurt = 0
                if (sprite_index == spr_idle1 || sprite_index == spr_idle2 || sprite_index == spr_idle3 || sprite_index == spr_idle4 || sprite_index == spr_idle5 || sprite_index == spr_idle6)
                {
                    if (floor(image_index) == (image_number - 1))
                    {
                        if string_contains(room_get_name(room), "freezer")
                        {
                            if (character == "P")
                                sprite_index = spr_player_freezeridle
                            else if (character == "N")
                                sprite_index = spr_playerN_freezeridle
                        }
                        else
                            sprite_index = spr_idle
                        idle = 0
                    }
                }
                if (idle >= 150 && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6 && facehurt == 0)
                {
                    randomise()
                    idleanim = random_range(0, 100)
                    if (idleanim <= 16)
                        sprite_index = spr_idle1
                    if (idleanim > 16 && idleanim < 32)
                        sprite_index = spr_idle2
                    if (idleanim > 32 && idleanim < 48)
                        sprite_index = spr_idle3
                    if (idleanim > 48 && idleanim < 64)
                        sprite_index = spr_idle4
                    if (idleanim > 64 && idleanim < 80)
                        sprite_index = spr_idle5
                    if (idleanim > 80)
                        sprite_index = spr_idle6
                    image_index = 0
                }
                if (idle < 150)
                {
                    if (facehurt == 0)
                    {
                        if (windingAnim < 1800 || angry == 1 || global.playerhealth == 1)
                        {
                            start_running = 1
                            if (global.minutes == 0 && global.seconds == 0)
                                sprite_index = spr_hurtidle
                            else if (global.panic == 1 || global.snickchallenge == 1)
                                sprite_index = spr_panic
                            else if (angry == 1)
                                sprite_index = spr_3hpidle
                            else
                                sprite_index = spr_idle
                        }
                        else if (character == "P" || character == "N")
                        {
                            idle = 0
                            windingAnim--
                            sprite_index = spr_winding
                        }
                    }
                }
                else if (facehurt == 1 && (character == "P" || character == "N"))
                {
                    windingAnim = 0
                    if (sprite_index != spr_facehurtup && sprite_index != spr_facehurt)
                        sprite_index = spr_facehurtup
                    if (floor(image_index) == (image_number - 1) && sprite_index == spr_facehurtup)
                        sprite_index = spr_facehurt
                }
            }
            else if (!facehurt)
            {
                if (windingAnim < 1800 || angry || global.playerhealth == 1 || shoot)
                {
                    start_running = 1
                    if (character != "D")
                        movespeed = 0
                    else if (character == "D")
                    {
                        if (movespeed > 0)
                            movespeed -= 0.25
                        if (movespeed < 0)
                            movespeed = 0
                    }
                    if shoot
                        sprite_index = spr_player_pistolidle
                    else if mort
                        sprite_index = spr_player_mortidle
                    else if (key_taunt && dancecharge < 1)
                        sprite_index = spr_breakdance
                    else if (global.minutes == 0 && global.seconds == 0)
                        sprite_index = spr_hurtidle
                    else if global.panic
                        sprite_index = spr_panic
                    else if (global.stylethreshold == 2 || pizzapepper == 1)
                        sprite_index = spr_3hpidle
                    else if (global.stylethreshold >= 3 || hyperpeppino == 1)
                        sprite_index = spr_rageidle
                    else if (pistolAnim == 1 && character == "P")
                        sprite_index = spr_player_pistolidle
                    else if string_contains(room_get_name(room), "freezer")
                    {
                        if (character == "P")
                            sprite_index = spr_player_freezeridle
                        else if (character == "N")
                            sprite_index = spr_playerN_freezeridle
                    }
                    else
                        sprite_index = spr_idle
                }
                else
                {
                    idle = 0
                    windingAnim--
                    sprite_index = spr_winding
                    if (key_taunt && dancecharge < 1)
                        sprite_index = spr_breakdance
                }
            }
            else
            {
                windingAnim = 0
                sprite_index = spr_facehurt
                if (key_taunt && dancecharge < 1)
                    sprite_index = spr_breakdance
            }
        }
    }
    if (movespeed > 8 && sprite_index != spr_playerN_walljump && isswimming == false)
        movespeed -= 0.1
    if (isswimming == true && movespeed > 6)
        movespeed -= 0.1
    if landAnim
    {
        if (sprite_index == spr_player_mortland)
        {
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0
                sprite_index = spr_player_mortidle
                image_index = 0
            }
        }
        else if (!shotgunAnim)
        {
            if (move == 0)
            {
                if (character != "D")
                    movespeed = 0
                if (character == "D")
                {
                    if (movespeed > 0)
                        movespeed -= 0.25
                    if (movespeed < 0)
                        movespeed = 0
                }
                if (pistolAnim == 1 && character == "P")
                    sprite_index = spr_player_pistolland
                else if (sprite_index != spr_playerV_holster)
                    sprite_index = spr_land
                if (floor(image_index) == (image_number - 1))
                    landAnim = 0
            }
            else
            {
                if (pistolAnim == 1 && character == "P")
                    sprite_index = spr_player_pistolland
                else if (sprite_index != spr_playerV_holster)
                    sprite_index = spr_land2
                if (floor(image_index) == (image_number - 1))
                {
                    landAnim = 0
                    if (isswimming == false)
                        sprite_index = spr_move
                    else if (character == "P")
                        sprite_index = spr_player_swimwalk
                    image_index = 0
                }
            }
        }
        else
        {
            sprite_index = spr_shotgunland
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0
                sprite_index = spr_shotgunidle
                if (move != 0)
                    sprite_index = spr_shotgunwalk
                image_index = 0
            }
        }
    }
    else if (shotgunAnim && sprite_index != spr_shotgunshoot && (!machslideAnim))
        sprite_index = (move == 0 ? spr_shotgunidle : spr_shotgunwalk)
    if machslideAnim
        sprite_index = spr_machslideend
    if (floor(image_index) == (image_number - 1))
    {
        switch sprite_index
        {
            case spr_machslideend:
                machslideAnim = 0
                sprite_index = spr_idle
                if shotgunAnim
                    sprite_index = spr_shotgunidle
                break
            case spr_christmasendscreen:
                sprite_index = spr_idle
                break
            case spr_shotgunshoot:
                sprite_index = spr_shotgunidle
                break
        }

    }
    if (key_up && key_jump2 && (character == "N" || character == "NE"))
    {
        state = states.Sjumpprep
        image_index = 0
        movespeed = 0
        sprite_index = spr_superjumpprep
    }
    if grounded
    {
        if ((key_jump || (input_buffer_jump < 8 && (!key_attack) && vsp > 0)) && (!key_down) && sprite_index != spr_player_pistolintro && character != "N" && character != "NE")
        {
            if (isswimming == true)
            {
                instance_create(x, y, obj_airbubble)
                instance_create(x, y, obj_airbubble)
                instance_create(x, y, obj_airbubble)
            }
            if (character == "P")
                scr_soundeffect(sfx_jump)
            else if (character == "N")
                scr_soundeffect(sfx_jumpN)
            else if (character == "V")
                scr_soundeffect(sfx_jumpV)
            else if (character == "M")
                scr_soundeffect(sfx_jumpM)
            if (sprite_index != spr_shotgunshoot)
            {
                if (sprite_index == spr_land2 && character == "P")
                {
                    sprite_index = spr_player_hanstandjump
                    scr_soundeffect(sfx_handstandjump)
                    movespeed += 3
                }
                else if (global.minutes == 0 && global.seconds == 0 && character == "P")
                    sprite_index = spr_player_hurtjump
                else
                    sprite_index = spr_jump
                facehurt = 0
                if shotgunAnim
                    sprite_index = spr_shotgunjump
                if (pistolAnim && character == "P")
                    sprite_index = spr_player_pistoljump1
                image_index = 0
            }
            particle_set_scale(4, xscale, 1)
            create_particle(x, y, 4, 0)
            if (sprite_index != spr_player_hanstandjump && character != "NE")
            {
                if (!inbackground)
                    vsp = -11
                else
                    vsp = -5.5
            }
            else if (character != "NE")
            {
                if (!inbackground)
                    vsp = -12.5
                else
                    vsp = -6.25
            }
            if (character == "NE")
            {
                if (!inbackground)
                    vsp = -10
                else
                    vsp = -5
            }
            state = states.jump
            jumpAnim = 1
            jumpstop = 0
            if place_meeting(x, (y + 1), obj_railparent)
                railmomentum = 1
            freefallstart = 0
        }
        if (((key_jump && (!key_up)) || (input_buffer_jump < 8 && (!key_attack) && vsp > 0)) && (!key_down) && sprite_index != spr_player_pistolintro && (character == "N" || character == "NE"))
        {
            if (isswimming == true)
            {
                instance_create(x, y, obj_airbubble)
                instance_create(x, y, obj_airbubble)
                instance_create(x, y, obj_airbubble)
            }
            scr_soundeffect(sfx_jumpN)
            facehurt = 0
            if (sprite_index != spr_shotgunshoot)
            {
                if (global.minutes == 0 && global.seconds == 0 && character == "P")
                    sprite_index = spr_player_hurtjump
                else
                    sprite_index = spr_jump
                if shotgunAnim
                    sprite_index = spr_shotgunjump
                if pistolAnim
                    sprite_index = spr_player_pistoljump1
                facehurt = 0
                image_index = 0
            }
            particle_set_scale(4, xscale, 1)
            create_particle(x, y, 4, 0)
            if (!inbackground)
                vsp = -11
            else
                vsp = -5.5
            state = states.jump
            jumpAnim = 1
            jumpstop = 0
            if place_meeting(x, (y + 1), obj_railparent)
                railmomentum = 1
            freefallstart = 0
        }
        if (!inbg)
        {
            if (key_down || (grounded && vsp > 0 && scr_solid(x, (y - 3)) && scr_solid(x, y)) || (place_meeting(x, y, obj_solid) && sprite_index != spr_playerN_tornado))
            {
                state = states.crouch
                landAnim = 0
                crouchAnim = 1
                image_index = 0
                idle = 0
            }
        }
    }
    else if (!key_jump)
    {
        if (sprite_index != spr_shotgunshoot)
        {
            if (!shotgunAnim)
                sprite_index = spr_fall
            else
                sprite_index = spr_shotgunfall
            image_index = 0
            jumpAnim = 0
        }
        else
            jumpAnim = 1
        state = states.jump
    }
    if (sprite_index == spr_breakdance && breakdance_speed > 0.4)
    {
        if ((!instance_exists(dashcloudid)) && grounded)
        {
            with (instance_create((x + 25), y, obj_dashcloud))
            {
                image_xscale = other.xscale
                other.dashcloudid = id
            }
        }
        if ((!instance_exists(dashcloudid)) && grounded)
        {
            with (instance_create((x - 25), y, obj_dashcloud))
            {
                image_xscale = (-other.xscale)
                other.dashcloudid = id
            }
        }
    }
    if (key_shoot2 && shotgunAnim)
        scr_shotgunshoot()
    if (key_slap2 && character == "D" && (!key_up))
    {
        state = 276
        scr_soundeffect(sfx_Nspin)
        image_index = 0
        if (move != 0 && movespeed < 12)
            movespeed += 3
        if (move == 0)
            movespeed = 9
    }
    if ((key_slap2 || input_buffer_slap < 8) && (!key_up) && pistolAnim == 0 && character != "V" && character != "NE" && character != "D")
    {
        if (shotgunAnim == 1)
            sprite_index = spr_shotgun_suplexdash
        else if (hyperpeppino == 0)
            sprite_index = spr_suplexdash
        else
            sprite_index = spr_player_lunge
        suplexmove = 1
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
        if (!instance_exists(obj_crazyrunothereffect))
        {
            with (instance_create((x + 12), y, obj_crazyrunothereffect))
                image_speed = 0.55
        }
        sfx_gain(suplexdashsnd)
        state = states.handstandjump
        if (isswimming == false)
        {
            if (hyperpeppino == 0)
            {
                if (movespeed < 7)
                    movespeed = 7
            }
            else
                movespeed = 11
        }
        image_index = 0
        flash = 1
    }
    else if ((key_slap2 || input_buffer_slap < 8) && key_up && character != "NE" && character != "V")
    {
        state = states.punch
        image_index = 0
        sprite_index = spr_uppercut
        flash = 1
        movespeed *= xscale
        if (character == "P")
        {
            if (!inbackground)
                vsp = -15
            else
                vsp = -7.5
        }
        else if (!inbackground)
            vsp = -21
        else
            vsp = -10.5
        uppercut = audio_play_sound(sfx_uppercut, 1, false)
        sfx_gain(uppercut)
        particle_set_scale(4, xscale, 1)
        create_particle(x, y, 4, 0)
    }
    switch character
    {
        case "N":
        case "P":
            if (key_attack && state != states.handstandjump && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(place_meeting((x + xscale * 5), y, obj_solid)))) && (!global.kungfu))
            {
                sprite_index = spr_mach1
                image_index = 0
                state = states.mach2
            }
            if (global.kungfu && key_attack && state != states.handstandjump)
            {
                state = states.blockstance
                sprite_index = spr_player_airattack
                hsp = 0
                movespeed = 0
            }
            if (character == "P" && keyboard_check_pressed(ord("H")) && hyperpeppino == 0 && global.stylemultiplier > 0.5)
            {
                hyperpeppino = 1
                global.superactive = 1
                audio_play_sound(sfx_blackoutpunch, 1, false, (global.option_sfx_volume / 3))
                sprite_index = spr_player_hyperpepintro
                image_index = 0
                state = states.titlescreen
            }
            break
        case "V":
            if (key_attack && state != states.handstandjump && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(place_meeting((x + xscale * 5), y, obj_solid)))) && (!global.kungfu))
            {
                sprite_index = spr_mach1
                image_index = 0
                state = states.mach2
                if (movespeed < 6 && isswimming == false)
                    movespeed = 6
                else if (isswimming == true && movespeed < 4)
                    movespeed = 4
            }
            if (key_shoot2 && (!instance_exists(dynamite_inst)))
            {
                if (move == 0)
                    movespeed = 0
                state = states.dynamite
                sprite_index = spr_playerV_dynamitethrow
                image_index = 0
                with (instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale
                    movespeed = 6 + obj_player.movespeed / 2 * obj_player.image_xscale
                    vsp = -6
                    other.dynamite_inst = id
                    playerid = other.id
                }
            }
            if key_slap2
            {
                if (move == 0)
                    movespeed = 0
                sprite_index = spr_playerV_revolvershoot
                with (instance_create((x + xscale * 20), (y + 5), obj_shotgunbullet))
                {
                    is_solid = 0
                    image_xscale = other.xscale
                    blur_effect = 2
                    sprite_index = spr_cheesebullet
                    image_speed = 0.5
                }
                scr_soundeffect(sfx_pistolshot)
                image_index = 0
                state = states.revolver
            }
            break
        case "NE":
            if key_attack
            {
                state = states.mach2
                if (movespeed < 6)
                    movespeed = 6
            }
            break
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
                vsp = -6
            }
            break
    }

    if ((key_slap2 || input_buffer_slap < 8) && (!key_up) && pistolAnim == 1 && character == "P")
    {
        sprite_index = spr_player_pistolshot
        image_index = 0
        instance_create(x, y, obj_peppinobullet)
        scr_soundeffect(sfx_killingblow)
        state = states.revolver
    }
    scr_dotaunt()
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0
        machslideAnim = 0
        image_speed = 0.45
    }
    return;
}

function state_pepperman_normal() //gml_Script_state_pepperman_normal
{
    pepperman_grab_reset()
    move = key_left + key_right
    if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
        movespeed += pepperman_accel
    else if (move != 0 && move != sign(xscale) && movespeed > 0)
        movespeed -= pepperman_deccel
    else if (move == 0)
        movespeed -= pepperman_deccel
    if (floor(movespeed) == pepperman_maxhsp_normal)
        movespeed = pepperman_maxhsp_normal
    if (movespeed > pepperman_maxhsp_normal)
        movespeed -= 0.3
    else if (movespeed < 0)
        movespeed = 0
    if (move != 0 && movespeed == 0)
        xscale = move
    hsp = xscale * movespeed
    if (movespeed > 0.5 && sprite_index != spr_pepperman_throw && grounded)
        sprite_index = spr_pepperman_move
    if (move == 0 && grounded && movespeed < 0.5 && sprite_index != spr_playerV_holster)
    {
        if (global.stylethreshold == 2)
            sprite_index = spr_3hpidle
        else
            sprite_index = spr_idle
    }
    if ((input_buffer_jump < 8 || key_jump) && grounded && vsp > 0)
    {
        if (character == "P")
            scr_soundeffect(sfx_jump)
        else if (character == "N")
            scr_soundeffect(sfx_jumpN)
        else if (character == "V")
            scr_soundeffect(sfx_jumpV)
        else if (character == "M")
            scr_soundeffect(sfx_jumpM)
        sprite_index = spr_jump
        facehurt = 0
        image_index = 0
        jumpAnim = 1
        vsp = (-pepperman_jumpspeed)
        state = states.jump
        with (instance_create(x, (y - 5), obj_highjumpcloud2))
        {
            if obj_player.inbackground
            {
                image_xscale = playerid.xscale * playerid.scale_xs
                image_yscale = playerid.yscale * playerid.scale_ys
            }
            else
                image_xscale = other.xscale
        }
    }
    if ((!grounded) && (!key_jump))
    {
        state = states.jump
        sprite_index = spr_fall
        facehurt = 0
    }
    if (grounded && key_down && (!(place_meeting(x, (y + 64), obj_ladder))))
    {
        state = states.machroll
        image_index = 0
        image_speed = 1
        movespeed = 11
        sprite_index = spr_pepperman_rolling
    }
    if (grounded && key_attack && ((!(place_meeting((x + xscale), y, obj_solid))) || place_meeting((x + xscale), y, obj_destructibles)) && pepperman_grabID == noone && sprite_index != spr_pepperman_throw && sprite_index != spr_pepperman_shoulderturn && sprite_index != spr_pepperman_shoulderturnloop)
    {
        if (move != 0)
            xscale = move
        state = states.shoulderbash
        sprite_index = spr_pepperman_shoulderstart
        flash = 1
        movespeed = 10
        image_index = 0
        scr_soundeffect(sfx_suplexdash)
    }
    if (sprite_index == spr_pepperman_throw && sprite_index != spr_pepperman_land && floor(image_index) == (image_number - 1))
    {
        if (global.stylethreshold == 2)
            sprite_index = spr_3hpidle
        else
            sprite_index = spr_idle
    }
    if (move != 0 && (floor(image_index) == 4 || floor(image_index) == 11) && steppy == 0 && character != "V")
    {
        instance_create(x, (y + 38), obj_cloudeffect)
        steppy = 1
    }
    scr_dotaunt()
    if (move != 0 && floor(image_index) != 4 && floor(image_index) != 11)
        steppy = 0
    image_speed = 0.35
    return;
}

function pepperman_grab_reset() //gml_Script_pepperman_grab_reset
{
    if (pepperman_grabID != noone)
    {
        if (!instance_exists(pepperman_grabID))
            pepperman_grabID = -4
    }
    return;
}

function scr_player_normal() //gml_Script_scr_player_normal
{
    if (character != "M" && character != "S")
        state_player_normal()
    else if (character == "M")
        state_pepperman_normal()
    else if (character == "S")
        state_snick_normal()
    return;
}

function state_snick_normal() //gml_Script_state_snick_normal
{
    mach4flame = 5
    vspmax = -3
    canceldiving = 0
    spindelay = 4
    mach2 = 0
    move = key_left + key_right
    hsp = move * movespeed + railmovespeed * raildir
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_land || sprite_index == spr_playerV_holster)
            landAnim = 0
    }
    if (move != 0)
    {
        image_speed = movespeed / 20 + 0.1
        if (movespeed < 9)
            movespeed += 0.5
        state = states.mach2
        if (!landAnim)
            sprite_index = spr_move
        xscale = move
        if (movespeed > 9)
            movespeed -= 0.1
    }
    else
    {
        image_speed = 0.4
        if (movespeed > 0)
            movespeed -= 0.5
        if (!landAnim)
            sprite_index = spr_idle
        if (movespeed < 0)
            movespeed = 0
    }
    if (key_jump && grounded && (!key_down))
    {
        state = states.jump
        vsp = -11
        sprite_index = spr_jump
    }
    if (!grounded)
    {
        state = states.jump
        if (!key_jump2)
            sprite_index = spr_fall
    }
    if (key_down && key_jump)
    {
        sprite_index = spr_playerS_spindash
        image_speed = 0.3
        dashspeed = 14
        state = states.spindash
        movespeed = 0
        hsp = 0
        audio_play_sound(sfx_spindash, 1, false, global.option_sfx_volume, 0, (dashspeed / 12))
    }
    scr_dotaunt()
    return;
}

