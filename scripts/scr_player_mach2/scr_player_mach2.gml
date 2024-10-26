function scr_player_mach2() //gml_Script_scr_player_mach2
{
    audio_stop_sound(sfx_cancelN)
    audio_stop_sound(sfx_hypernoisehover)
    if grounded
        doublejump = 0
    reboundvsp = 0
    attacksleft = 2
    canceldiving = 0
    if (movespeed < 5)
        movespeed += 0.5
    if ((sprite_index == spr_walljumpend || sprite_index == spr_playerV_walljumpturn) && character == "V")
    {
        if (xscale != move && move != 0)
        {
            movespeed = 0
            xscale = move
            image_index = 0
            sprite_index = spr_playerV_walljumpturn
        }
        if (movespeed < 12 && move != 0)
            movespeed += 1
        if (movespeed > 12)
            movespeed -= 0.5
    }
    if (sprite_index == spr_taunt)
    {
        if (movespeed == 0 && sprite_index != spr_playerN_sjumpcancelstart && sprite_index != spr_playerN_sjumpcancelspin && sprite_index != spr_playerV_walljumpend && sprite_index != spr_playerV_walljumpturn)
            sprite_index = spr_mach
    }
    if (sprite_index == spr_playerN_walljump)
    {
        if (punch_afterimage > 0)
            punch_afterimage--
        else
        {
            punch_afterimage = 5
            create_blue_afterimage(x, y, sprite_index, image_index, xscale)
        }
    }
    if (key_shoot2 && character == "P" && blackbelt == 1)
    {
        state = states.blackbelt
        movespeed = 12 * xscale
        landAnim = 0
        if grounded
            sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
        else
            sprite_index = choose(spr_player_kungfuair1transition, spr_player_kungfuair2transition, spr_player_kungfuair3transition)
        scr_soundeffect(sfx_suplexdash)
        image_index = 0
    }
    if (windingAnim < 2000)
        windingAnim++
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    hsp = xscale * movespeed + railmovespeed * raildir
    move2 = key_right2 + key_left2
    move = key_right + key_left
    if (sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfu3 && sprite_index != spr_player_kungfuair1transition && sprite_index != spr_player_kungfuair2transition && sprite_index != spr_player_kungfuair3transition)
    {
        crouchslideAnim = 1
        if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
        {
            if (sprite_index != spr_playerN_sjumpcancelstart && sprite_index != spr_playerN_sjumpcancelspin)
                vsp /= 20
            jumpstop = 1
        }
        if (grounded && vsp > 0)
            jumpstop = 0
        if (input_buffer_jump < 8 && grounded && sprite_index != spr_secondjump1 && sprite_index != spr_playerV_walljumpturn && sprite_index != spr_clownjump && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
        {
            image_index = 0
            if (sprite_index != spr_playerN_sjumpcancelstart && sprite_index != spr_playerN_sjumpcancelspin && sprite_index != spr_playerV_walljumpend && sprite_index != spr_playerV_walljumpturn)
                sprite_index = spr_secondjump1
            if (character != "N")
                scr_soundeffect(sfx_jump)
            else
                scr_soundeffect(sfx_jumpN)
            if skateboarding
                sprite_index = spr_clownjump
            if (!inbackground)
                vsp = -11
            else
                vsp = -5.5
        }
        if grounded
        {
            if (hyperpeppino == 1)
                movespeed += 0.15
            else if (hypernoise == 1)
                movespeed += 0.05
        }
        var mortjump = 0
        if (key_jump && global.mort == 1 && sprite_index != spr_mortdoublejump && (!grounded) && (!skateboarding))
        {
            state = states.jump
            repeat (6)
                create_debris(x, y, spr_feather)
            scr_soundeffect(sfx_woosh)
            sprite_index = spr_mortdoublejump
            image_index = 0
            grav = 0.25
            with (instance_create(x, y, obj_highjumpcloud2))
                image_xscale = other.xscale
            mort = 1
            mortjump = 1
        }
        if (sprite_index == spr_mach1)
        {
            if (movespeed < 6)
                movespeed += 0.25
        }
        else if (movespeed < 4)
            movespeed = 4
        if (grounded && vsp > 0)
        {
            if (machpunchAnim == 0 && sprite_index != spr_mach && sprite_index != spr_mach1 && sprite_index != spr_mach4 && sprite_index != spr_player_machhit && sprite_index != spr_playerN_mach21 && sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfuair3 && sprite_index != spr_player_kungfuair1transition && sprite_index != spr_player_kungfuair2transition && sprite_index != spr_player_kungfuair3transition)
            {
                if (sprite_index != spr_player_machhit && sprite_index != spr_playerN_mach21 && sprite_index != spr_rollgetup && sprite_index != spr_suplexdash && sprite_index != spr_taunt && sprite_index != spr_playerN_sjumpcancelstart && sprite_index != spr_playerN_sjumpcancelspin && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfuair3 && sprite_index != spr_player_kungfuair1transition && sprite_index != spr_player_kungfuair2transition && sprite_index != spr_player_kungfuair3transition && sprite_index != spr_playerV_walljumpend && sprite_index != spr_playerV_walljumpturn)
                    sprite_index = spr_mach
            }
            if ((grounded && sprite_index == spr_walljumpend) || sprite_index == spr_playerV_walljumpturn)
                sprite_index = spr_mach
            if (machpunchAnim == 1)
            {
                if (punch == 0)
                    sprite_index = spr_machpunch1
                if (punch == 1)
                    sprite_index = spr_machpunch2
                if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
                {
                    punch = 1
                    machpunchAnim = 0
                }
                if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
                {
                    punch = 0
                    machpunchAnim = 0
                }
            }
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach1)
            sprite_index = spr_mach
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_longjump)
            sprite_index = spr_longjumpend
        if (sprite_index == spr_longjump)
            image_speed = 0.4
        if (!grounded)
            machpunchAnim = 0
        if grounded
        {
            if (global.slopemomentum == false)
            {
                if (scr_slope() && hsp != 0 && movespeed > 8)
                    scr_player_addslopemomentumold(0.1, 0.2)
            }
            else if (global.slopemomentum == true)
            {
                if (scr_slope() && hsp != 0)
                    scr_player_addslopemomentum(0.1, 0.2, 9)
            }
            if (movespeed < 12)
            {
                if (mach4mode == 0 && isswimming == false)
                    movespeed += 0.08
                else if (isswimming == false)
                    movespeed += 0.175
                else
                    movespeed += 0.045
            }
            if (abs(hsp) >= 11 && skateboarding == 0 && sprite_index != spr_suplexdash && sprite_index != spr_shotgun_suplexdash && character != "D")
            {
                if (!instance_exists(obj_crazyrunothereffect))
                {
                    with (instance_create((x + 12), y, obj_crazyrunothereffect))
                        image_speed = 0.5
                }
                machhitAnim = 0
                state = states.mach3
                scr_soundeffect(sfx_mach3startup)
                flash = 1
                if (sprite_index != spr_rollgetup)
                {
                    if (character == "P")
                        sprite_index = spr_player_machhit
                    else if (character == "N")
                        sprite_index = spr_playerN_mach21
                }
                sprite_index = spr_dashpadmach
                if (movespeed < 12)
                    movespeed = 12
                image_index = 5
                particle_set_scale(5, xscale, 1)
                create_particle(x, y, 5, 0)
            }
        }
        if key_jump
            input_buffer_jump = 0
        if ((((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope))) && character != "D")
        {
            wallspeed = movespeed
            if (character == "V")
                wallspeed += 4
            if (vsp > 0)
                wallspeed -= vsp
            state = states.climbwall
            audio_stop_sound(sfx_wallbounce)
        }
        if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_climbablewall) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && character != "D")
        {
            if (character == "V")
                wallspeed += 4
            wallspeed = movespeed
            state = states.climbwall
            audio_stop_sound(sfx_wallbounce)
        }
        if ((!instance_exists(dashcloudid)) && grounded)
        {
            if (isswimming == true)
            {
                instance_create(x, y, obj_airbubble)
                instance_create(x, y, obj_airbubble)
            }
            with (instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale
                other.dashcloudid = id
            }
        }
        if (grounded && floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_rampjump))
        {
            if (character == "P")
                sprite_index = spr_player_machhit
            else if (character == "N")
                sprite_index = spr_playerN_mach21
            else
                sprite_index = spr_mach
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_suplexdash)
            sprite_index = spr_mach
        if ((!grounded) && sprite_index != spr_secondjump2 && sprite_index != spr_clownjump && sprite_index != spr_clownfall && sprite_index != spr_playerN_sjumpcancelstart && sprite_index != spr_playerN_sjumpcancelspin && sprite_index != spr_mach2jump && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_walljumpend && sprite_index != spr_longjump && sprite_index != spr_longjumpend && sprite_index != spr_playerN_sjumpcancelstart && sprite_index != spr_playerN_sjumpcancelspin && sprite_index != spr_airdash1 && sprite_index != spr_airdash2 && sprite_index != spr_playerN_sjumpcancelspin && sprite_index != spr_playerV_walljumpend && sprite_index != spr_playerV_walljumpturn)
        {
            if (movespeed < 9)
                sprite_index = spr_airdash1
            else
                sprite_index = spr_secondjump1
            if skateboarding
                sprite_index = spr_clownfall
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
            sprite_index = spr_secondjump2
        if (floor(image_index) == (image_number - 1) && (sprite_index == spr_walljumpstart || sprite_index == spr_playerV_walljumpturn))
            sprite_index = spr_walljumpend
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_airdash1)
            sprite_index = spr_airdash2
        if ((!grounded) && sprite_index != spr_clownfall && sprite_index == spr_clownjump && floor(image_index) == (image_number - 1))
            sprite_index = spr_clownfall
        if (key_down && character != "S" && (!(place_meeting(x, y, obj_dashpad))))
        {
            if (character != "N")
            {
                particle_set_scale(5, xscale, 1)
                create_particle(x, y, 5, 0)
                flash = 0
                state = states.tumble
                state = states.tumble
                vsp = 10
                image_index = 0
            }
            else if (character == "N" && grounded)
            {
                particle_set_scale(5, xscale, 1)
                create_particle(x, y, 5, 0)
                flash = 0
                state = states.tumble
                vsp = 10
                image_index = 0
            }
            if ((!grounded) && sprite_index != spr_player_Sjumpcancelstart)
            {
                image_index = 0
                if (character != "N")
                {
                    if (character == "P")
                        sprite_index = spr_player_diveintro
                    else
                        sprite_index = spr_dive
                    scr_soundeffect(sfx_dive)
                    state = states.tumble
                    if (isswimming == true)
                    {
                        instance_create(x, (y + 32), obj_airbubble)
                        instance_create(x, (y + 32), obj_airbubble)
                    }
                }
                else
                {
                    state = states.spin
                    movespeed *= xscale
                    hsp = movespeed
                    sprite_index = spr_playerN_tornado_air
                }
            }
            else
            {
                if (character != "V")
                    sprite_index = spr_machroll
                else
                    sprite_index = spr_playerV_divekickstart
                image_index = 0
            }
        }
        if place_meeting(x, y, obj_bgsolid)
            x -= xscale
        if (scr_solid((x + xscale), y) && (!scr_slope()) && (!(place_meeting((x + xscale), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (grounded || fightball == 1))
        {
            if skateboarding
                xscale *= -1
            else
            {
                var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
                if _bump
                {
                    state = states.bump
                    image_index = 0
                    scr_soundeffect(sfx_bumpwall)
                    sprite_index = spr_wallsplat
                }
            }
        }
        if (character == "S")
        {
            if (move == 0)
                state = states.normal
            if (key_down && key_jump && grounded)
            {
                sprite_index = spr_playerS_spindash
                image_speed = 0.3
                dashspeed = 14
                state = states.spindash
                movespeed = 0
                hsp = 0
                audio_play_sound(sfx_spindash, 1, false, global.option_sfx_volume, 0, (dashspeed / 12))
            }
            if (move != 0)
                xscale = move
            if (move == 0)
                state = states.normal
            if (key_down2 && (!grounded))
            {
                sprite_index = spr_bodyslamstart
                vsp = -9
                audio_stop_sound(sfx_groundpoundstart)
                scr_soundeffect(sfx_groundpoundstart)
                image_index = 0
                state = states.freefallprep
            }
        }
        if ((!key_attack) && movespeed >= 8 && grounded && skateboarding == 0 && character != "S")
        {
            if (character != "D")
            {
                image_index = 0
                state = states.machslide
                scr_soundeffect(sfx_break)
                sprite_index = spr_machslidestart
            }
            else if (!key_slap)
            {
                image_index = 0
                state = states.machslide
                scr_soundeffect(sfx_break)
                sprite_index = spr_machslidestart
            }
        }
        else if ((!key_attack) && movespeed < 8 && grounded && skateboarding == 0 && character != "S")
            state = states.normal
        if (character == "D" && key_attack2 && key_slap)
        {
            sprite_index = spr_playerN_pogostart
            image_index = 0
            pogospeed = 10
            state = states.pogo
            if grounded
                vsp = -6
        }
        if (move == (-xscale) && movespeed >= 8 && grounded && skateboarding == 0 && character != "S")
        {
            scr_soundeffect(sfx_machslideboost)
            image_index = 0
            state = states.machslide
            sprite_index = spr_machslideboost
        }
        else if (move == (-xscale) && movespeed < 8 && grounded && skateboarding == 0)
        {
            xscale *= -1
            movespeed = 6
        }
        if (clowntimer > 0 && skateboarding == 1)
            clowntimer--
        if (clowntimer <= 0 && skateboarding == 1)
        {
            state = states.normal
            instance_create(x, y, obj_genericpoofeffect)
        }
        if (key_slap2 && character == "V")
        {
            vsp = -3.5
            state = states.revolver
            image_index = 0
            sprite_index = spr_playerV_airrevolver
            image_index = 0
            with (instance_create((x + xscale * 20), (y + 5), obj_shotgunbullet))
            {
                is_solid = 0
                image_xscale = other.xscale
                sprite_index = spr_cheesebullet
                image_speed = 0.4
            }
            scr_soundeffect(sfx_killingblow)
        }
        if (key_shoot2 && character == "V" && (!instance_exists(dynamite_inst)))
        {
            vsp = -5
            state = states.dynamite
            image_index = 0
            sprite_index = spr_playerV_dynamitethrow
            with (instance_create(x, y, obj_dynamite))
            {
                image_xscale = other.xscale
                other.dynamite_inst = id
                playerid = other.id
                movespeed = other.movespeed + 4
                vsp = -6
            }
        }
        if (key_jump && (!grounded) && hypernoise == 1 && character == "N")
        {
            state = states.hypersoar
            image_index = 0
            flash = 1
            alarm[0] = 1
            if (xscale == -1)
                movespeed = (-movespeed)
        }
        if (sprite_index == spr_rollgetup || sprite_index == spr_suplexdash)
            image_speed = 0.4
        else if (sprite_index != spr_longjump)
            image_speed = abs(movespeed) / 15
        scr_dotaunt()
        if (skateboarding && sprite_index != spr_clownjump && grounded)
            sprite_index = spr_clown
        if mortjump
            sprite_index = spr_player_mortjumpstart
        if (key_slap2 && character == "D" && (!key_up))
        {
            state = 276
            scr_soundeffect(sfx_Nspin)
            image_index = 0
        }
        if ((key_slap2 || input_buffer_slap < 8) && (!key_up) && character != "V" && character != "NE" && character != "D")
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
                    movespeed = 8
                else
                    movespeed = 14
            }
            image_index = 0
            flash = 1
        }
        if (character == "NE")
        {
            if grounded
                movespeed += 0.15
        }
        if (key_shoot2 && shotgunAnim == 1)
            scr_shotgunshoot()
        if (global.attackstyle == 2 && key_slap2)
        {
            randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_barreljump, spr_tv_bubbleopen, spr_player_barrelfloat, spr_punch])
            image_index = 0
            state = states.lungeattack
        }
        if (key_jump && key_up && character == "N")
        {
            sprite_index = Spr_playerN_crusherstart
            scr_soundeffect(sfx_crusherstart)
            image_index = 0
            momemtum = 1
            hsp = movespeed * xscale
            state = states.freefall
            vsp = -15
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_sjumpcancelstart)
            sprite_index = spr_playerN_sjumpcancelspin
        if (character == "V" && sprite_index == spr_playerV_spinjump1 && floor(image_index) == (image_number - 1))
            sprite_index = spr_playerV_spinjump2
        if (key_slap2 && key_up && (!key_down2) && (!grounded) && character != "V")
        {
            state = states.punch
            image_index = 0
            sprite_index = spr_uppercut
            movespeed *= xscale
            if (character == "P")
                vsp = -10
            else
                vsp = -18
            uppercut = audio_play_sound(sfx_uppercut, 1, false)
            sfx_gain(uppercut)
            particle_set_scale(4, xscale, 1)
            create_particle(x, y, 4, 0)
        }
        if (sprite_index == spr_player_machhit)
            image_speed = 0.4
    }
    if (character == "D" && place_meeting((x + xscale), y, obj_solid) && (!grounded))
    {
        xscale = (-xscale)
        state = states.climbwall
        sprite_index = spr_playerN_noisebombspinjump
        scr_soundeffect(sfx_groundpound)
        instance_create((x + 16 * xscale), y, obj_bangeffect)
        image_speed = 0.35
        if key_jump2
            vsp = -14
        else
            vsp = 7
    }
    if (character == "D")
    {
        state = states.pogo
        pogospeed = 10
    }
    if (grounded && (sprite_index == spr_playerN_skateboarddoublejump || sprite_index == spr_playerN_skateboarddoublejumpfall))
    {
        doublejump = 0
        if (mach4mode == 0 && (sprite_index != spr_playerN_sjumpcancelstart || sprite_index != spr_playerN_sjumpcancelspin))
            sprite_index = spr_mach4
        else if (sprite_index != spr_playerN_sjumpcancelstart || sprite_index != spr_playerN_sjumpcancelspin)
            sprite_index = spr_crazyrun
    }
    return;
}

