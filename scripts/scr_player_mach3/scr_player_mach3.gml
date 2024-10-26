function scr_player_mach3() //gml_Script_scr_player_mach3
{
    if (windingAnim < 2000)
        windingAnim++
    if grounded
    {
        longjumpready = 1
        doublejump = 0
    }
    reboundvsp = 0
    canceldiving = 0
    if (character == "M")
    {
        state = states.shoulderbash
        sprite_index = spr_pepperman_shoulderloop
    }
    attacksleft = 2
    if (inbg && movespeed > 18)
        movespeed = 18
    if (initialboost > 0)
        initialboost -= 0.45
    if (key_shoot2 && character == "P" && blackbelt == 1 && character != "D")
    {
        state = states.blackbelt
        landAnim = 0
        movespeed *= xscale
        if grounded
            sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
        else
            sprite_index = choose(spr_player_kungfuair1transition, spr_player_kungfuair2transition, spr_player_kungfuair3transition)
        scr_soundeffect(sfx_suplexdash)
        image_index = 0
    }
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    if (sprite_index == spr_taunt)
    {
        if (movespeed < 18)
            sprite_index = spr_mach4
        else
            sprite_index = spr_crazyrun
    }
    hsp = xscale * (movespeed + initialboost) + railmovespeed * raildir
    if grounded
    {
        if (global.slopemomentum == false)
        {
            if (scr_slope() && hsp != 0 && movespeed > 10)
                scr_player_addslopemomentumold(0.1, 0.2)
        }
        else if (global.slopemomentum == true)
        {
            if (scr_slope() && hsp != 0)
                scr_player_addslopemomentum(0.1, 0.2, 17)
        }
    }
    if (move == xscale && grounded && character != "D")
    {
        if (movespeed < 20)
        {
            if (mach4mode == 0)
                movespeed += 0.013
            else if (isswimming == false && sprite_index != spr_playerN_jetpackboost)
                movespeed += 0.05
            else
                movespeed += 0.013
        }
    }
    if ((sprite_index == spr_mach2jump || sprite_index == spr_playerV_spinjump2 || sprite_index == spr_freefallcancel) && grounded)
    {
        if (mach4mode == 0)
            sprite_index = spr_mach4
        else
            sprite_index = spr_crazyrun
    }
    if (grounded && sprite_index == spr_Sjumpcancel)
        sprite_index = spr_mach4
    if (movespeed > 18 && character == "V")
        movespeed -= 0.1
    mach2 = 100
    momemtum = 1
    move = key_right + key_left
    move2 = key_right2 + key_left2
    if (fightball == 1 && global.coop == 1)
    {
        if (object_index == obj_player1)
        {
            x = obj_player2.x
            y = obj_player2.y
        }
        if (object_index == obj_player2)
        {
            x = obj_player1.x
            y = obj_player1.y
        }
    }
    if (sprite_index == spr_crazyrun)
    {
        if (flamecloud_buffer > 0)
            flamecloud_buffer--
        else
        {
            flamecloud_buffer = 10
            with (instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale
                sprite_index = spr_flamecloud
            }
        }
    }
    if (movespeed < 20)
    {
        if (move == xscale)
            movespeed += 0.02
    }
    if (move != 0 && grounded && hyperpeppino == 1)
    {
        if (mach4mode == 0)
            movespeed += 0.1
        else
            movespeed += 0.01
    }
    if (move != 0 && grounded && hypernoise == 1)
    {
        if (mach4mode == 0)
            movespeed += 0.05
        else
            movespeed += 0.005
    }
    crouchslideAnim = 1
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && character != "D")
    {
        if (sprite_index != spr_Sjumpcancel)
            vsp /= 10
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
    {
        scr_soundeffect(sfx_jump)
        if (sprite_index != spr_fightball)
        {
            image_index = 0
            sprite_index = spr_mach3jump
        }
        if (character == "P" || character == "V")
        {
            if (!inbackground)
                vsp = -11
            else
                vsp = -5.5
        }
        else if (!inbackground)
            vsp = -11
        else
            vsp = -5.5
    }
    if (doublejump == 0 && (!grounded) && key_jump && character == "N" && (!key_up))
    {
        sprite_index = spr_playerN_skateboarddoublejump
        scr_soundeffect(sfx_woosh)
        image_index = 0
        doublejump = 1
        vsp = -9
    }
    if (grounded && (sprite_index == spr_playerN_skateboarddoublejump || sprite_index == spr_playerN_skateboarddoublejumpfall))
    {
        doublejump = 0
        if (mach4mode == 0)
            sprite_index = spr_mach4
        else
            sprite_index = spr_crazyrun
    }
    if (fightball == 0)
    {
        if (sprite_index == spr_playerN_skateboarddoublejump && floor(image_index) == (image_number - 1))
            sprite_index = spr_playerN_skateboarddoublejumpfall
        if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
            sprite_index = spr_mach4
        if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_playerV_machhit1 || sprite_index == spr_playerV_machhit2 || sprite_index == spr_dashpadmach))
            sprite_index = spr_mach4
        if ((sprite_index == spr_mach2jump && grounded && vsp > 0) || (sprite_index == spr_playerN_jetpackboost && grounded) || (sprite_index == spr_playerN_noisebombspinjump && grounded))
            sprite_index = spr_mach4
        if (movespeed > 18 && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt && sprite_index != spr_playerN_jetpackboost && character != "D")
        {
            if (character != "NE" && character != "D")
                mach4mode = 1
            flash = 1
            sprite_index = spr_crazyrun
            repeat (3)
            {
                with (create_debris(x, y, spr_slapstar))
                {
                    hsp = random_range(-5, 5)
                    vsp = random_range(-10, 10)
                }
            }
        }
        else if (movespeed <= 16 && sprite_index == spr_crazyrun)
            sprite_index = spr_mach4
    }
    if (sprite_index == spr_crazyrun && (!instance_exists(crazyruneffectid)))
    {
        with (instance_create(x, y, obj_crazyrunothereffect))
        {
            playerid = other.object_index
            other.crazyruneffectid = id
        }
    }
    if (sprite_index == spr_mach4 || sprite_index == spr_mach3jump || sprite_index == spr_fightball || sprite_index == spr_player_dashpad)
        image_speed = 0.4
    if (sprite_index == spr_crazyrun)
        image_speed = 0.75
    if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_playerV_machhit1 || sprite_index == spr_playerV_machhit2)
        image_speed = 0.4
    if (key_jump && character != "D")
        input_buffer_jump = 0
    if (key_up && fightball == 0 && character != "V" && character != "D" && grounded && (!(place_meeting(x, y, obj_dashpad))))
    {
        sprite_index = spr_superjumpprep
        state = states.Sjumpprep
        image_index = 0
    }
    if (global.attackstyle == 2 && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_barreljump, spr_tv_bubbleopen, spr_player_barrelfloat, spr_punch])
        image_index = 0
        state = states.lungeattack
    }
    if (character != "S")
    {
        if (((!key_attack) && fightball == 0 && grounded && (character == "P" || character == "V" || character == "N" || character == "NE")) || (character == "S" && (move == 0 || move != xscale) && grounded && fightball == 0))
        {
            sprite_index = spr_machslidestart
            scr_soundeffect(sfx_break)
            state = states.machslide
            image_index = 0
        }
    }
    if ((grounded && move != xscale && character == "S") || (character == "S" && move == 0))
    {
        sprite_index = spr_machslidestart
        scr_soundeffect(sfx_break)
        state = states.machslide
        image_index = 0
    }
    if (move == (-xscale) && grounded && (character == "P" || character == "V" || character == "N" || character == "NE") && fightball == 0)
    {
        scr_soundeffect(sfx_machslideboost)
        sprite_index = spr_mach3boost
        state = states.machslide
        image_index = 0
    }
    if (character == "D")
    {
        if ((!key_up) && (!key_down))
            vsp = 0
        if key_up
            vsp = -4
        if (key_down && sprite_index != spr_playerN_jetpackslide)
            vsp = 4
        if (key_jump && sprite_index != spr_playerN_jetpackslide)
        {
            state = states.pogo
            sprite_index = spr_playerN_pogostart
            pogospeed = movespeed
            vsp = -11
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
    if (grounded && sprite_index == spr_playerN_jetpackboost && key_down)
        sprite_index = spr_playerN_jetpackslide
    if (key_down && fightball == 0 && sprite_index != spr_playerN_jetpackboost && sprite_index != spr_playerN_jetpackslide && (!(place_meeting(x, y, obj_dashpad))))
    {
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        if (character != "N" && character != "D")
        {
            flash = 0
            if (character == "S" && (!grounded))
                state = states.tumble
            if (character != "S")
                state = states.tumble
            vsp = 10
            image_index = 0
        }
        else if (character == "N" && grounded && character != "D")
        {
            flash = 0
            if (character == "S" && (!grounded))
                state = states.tumble
            if (character != "S")
                state = states.tumble
            vsp = 10
            image_index = 0
        }
        if ((!grounded) && sprite_index != spr_playerN_jetpackboost && sprite_index != spr_playerN_jetpackslide && sprite_index != spr_playerN_sjumpcancelspin)
        {
            image_index = 0
            if (character != "N")
            {
                if (character == "P")
                    sprite_index = spr_player_diveintro
                else
                    sprite_index = spr_dive
                scr_soundeffect(sfx_dive)
            }
            else
            {
                state = states.spin
                movespeed *= xscale
                hsp = movespeed
                sprite_index = spr_playerN_tornado_air
            }
        }
        else if (sprite_index != spr_playerN_jetpackboost && sprite_index != spr_playerN_jetpackslide)
        {
            if (character != "V")
                sprite_index = spr_machroll
            else
                sprite_index = spr_playerV_divekickstart
            image_index = 0
        }
    }
    if (key_slap2 && (!((shotgunAnim == 1 && key_up))) && character != "V" && character != "NE" && character != "D")
    {
        alarm[8] = 60
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
        image_index = 0
        if (shotgunAnim == 0)
            sprite_index = spr_suplexdash
        else
            sprite_index = spr_shotgunsuplexdash
    }
    if (key_slap2 && character == "V")
    {
        vsp = -5
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
    if ((((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope))) && character != "D")
    {
        if (character != "V")
        {
            wallspeed = movespeed
            if (vsp > 0)
                wallspeed -= vsp
            state = states.climbwall
        }
        else if (!key_down)
        {
            wallspeed = movespeed
            if (vsp > 0)
                wallspeed -= vsp
            state = states.climbwall
            audio_stop_sound(sfx_wallbounce)
        }
        else
        {
            wallspeed = -8
            state = states.climbwall
            audio_stop_sound(sfx_wallbounce)
        }
    }
    if (character != "S")
    {
    }
    if (scr_solid((x + xscale), y) && (!scr_slope()) && (!(place_meeting((x + xscale), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (grounded || fightball == 1))
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
                hsp = -2.5
                vsp = -3
                mach2 = 0
                image_index = 0
                instance_create((x + 10), (y + 10), obj_bumpeffect)
            }
            fightball = 0
        }
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                instance_create(obj_player.x, obj_player.y, obj_slapstar)
            if obj_player.inbackground
            {
                image_xscale = obj_player.xscale * obj_player.scale_xs
                image_yscale = obj_player.yscale * obj_player.scale_ys
            }
            else
                image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    scr_dotaunt()
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create((x + 18 * xscale), y, obj_chargeeffect))
        {
            playerid = other.object_index
            other.chargeeffectid = id
        }
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
    if (mach4mode == 1 && mach4flame > 0)
        mach4flame--
    if (mach4flame <= 0)
    {
        if grounded
            instance_create(x, y, obj_flamecloudeffect)
        mach4flame = 5
    }
    if (mach4mode == 1 && sprite_index == spr_crazyrun)
    {
        camera_zoom(2, 0.001)
        if (punch_afterimage > 0)
            punch_afterimage--
        else
        {
            punch_afterimage = 5
            create_blue_afterimage(x, y, sprite_index, image_index, xscale)
        }
    }
    if (sprite_index == spr_player_machhit)
        sprite_index = spr_mach4
    if (sprite_index == spr_player_mach2jump)
    {
        sprite_index = spr_mach2jump
        image_speed = 0.5
    }
    if (character == "V" && sprite_index == spr_mach2jump && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_playerV_spinjump2
        image_speed = 0.5
    }
    if (key_jump && key_up && character == "N")
    {
        sprite_index = Spr_playerN_crusherstart
        momemtum = 1
        scr_soundeffect(sfx_crusherstart)
        image_index = 0
        state = states.freefall
        hsp = movespeed * xscale
        vsp = -15
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_sjumpcancelstart)
        sprite_index = spr_playerN_sjumpcancelspin
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
    if (character == "NE")
    {
        if (movespeed < 12)
            movespeed += 0.485
        if (movespeed < 17)
            movespeed += 0.024
        if (movespeed > 17)
            movespeed = 17
    }
    if ((!grounded) && place_meeting(x, y, obj_solid) && character == "N")
    {
        if (character != "N")
            scr_soundeffect(sfx_jump)
        else
            scr_soundeffect(sfx_jumpN)
        jumpstop = 0
        vsp = bounceheight
        bounceheight += 2.5
        state = states.walljump
        sprite_index = spr_playerN_walljump
        image_index = 0
        with (instance_create(x, y, obj_noisehitfx))
            image_xscale = other.xscale
    }
    if (character == "S")
    {
        if (movespeed < 14)
            movespeed = 14
        if (key_down && character == "S" && (!grounded) && (!(place_meeting(x, y, obj_dashpad))))
        {
            particle_set_scale(5, xscale, 1)
            create_particle(x, y, 5, 0)
            flash = 0
            state = states.tumble
            vsp = 10
            image_index = 0
        }
    }
    if (character == "D")
    {
        image_speed = 0.4
        if (movespeed < 16 && move == xscale)
            movespeed += 0.1
        if (move != 0 && move != xscale && movespeed > 10)
            movespeed -= 0.1
        if (grounded && key_down && sprite_index != spr_playerN_pogostart)
            sprite_index = spr_playerN_jetpackslide
        else if (sprite_index != spr_playerN_pogostart && (!(place_meeting(x, (y - 16), obj_solid))))
            sprite_index = spr_playerN_jetpackboost
    }
    if (character == "D" && place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_destroyable))) && (!(place_meeting((x + xscale), y, obj_destroyable3))))
    {
        xscale = (-xscale)
        state = states.climbwall
        sprite_index = spr_playerN_noisebombspinjump
        scr_soundeffect(sfx_groundpound)
        instance_create((x + 16 * xscale), y, obj_bangeffect)
        image_speed = 0.35
        vsp = -14
    }
}

