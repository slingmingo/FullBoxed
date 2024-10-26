function scr_player_climbwall() //gml_Script_scr_player_climbwall
{
    if (climbbuffer > 0)
        climbbuffer--
    switch character
    {
        case "P":
            if (wallspeed > 0)
                image_speed = 0.2 + wallspeed / 32
            else
                image_speed = 0.2
            if (windingAnim < 200)
                windingAnim++
            move = key_left + key_right
            suplexmove = 0
            if (wallspeed < 10)
                wallspeed += 0.3
            if inbackground
                vsp = (-wallspeed) / 2
            else
                vsp = (-wallspeed)
            if (wallspeed < 18)
                wallspeed += 0.115
            if (wallspeed < 21)
                wallspeed += 0.1
            if (hyperpeppino == 1)
            {
                if (wallspeed < 24)
                    wallspeed += 0.15
            }
            if (wallspeed < 0)
            {
                if (mach4mode == 0)
                {
                    if (isswimming == false)
                        movespeed += 0.25
                    else
                        movespeed += 0.1
                }
                else if (isswimming == false)
                    movespeed += 0.45
                else
                    movespeed += 0.15
            }
            crouchslideAnim = 1
            if (vsp < -5)
                sprite_index = spr_machclimbwall
            else
            {
                sprite_index = spr_clingwall
                if (isswimming == false)
                    wallspeed += 0.15
            }
            if ((!key_attack) && climbbuffer == 0 && (!skateboarding))
            {
                state = states.jump
                sprite_index = spr_machfreefall
                movespeed = 0
                railmovespeed = 6
                raildir = (-xscale)
            }
            if (verticalbuffer <= 0 && place_meeting(x, (y - 1), obj_solid) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    scr_soundeffect(sfx_groundpound)
                    image_index = 0
                    state = states.Sjumpland
                    machhitAnim = 0
                }
                else if (!key_jump)
                {
                    state = states.bump
                    hsp = -2.5 * xscale
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            if (verticalbuffer <= 0 && (!(scr_solid((x + 14 * xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                trace("climbwall out")
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                if (wallspeed < 6)
                    wallspeed = 6
                if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                {
                    state = states.mach2
                    movespeed = wallspeed
                }
                else if (wallspeed >= 12)
                {
                    state = states.mach3
                    sprite_index = spr_mach4
                    movespeed = wallspeed
                }
                if (move != xscale && move != 0)
                {
                    scr_soundeffect(sfx_machslideboost)
                    sprite_index = spr_mach3boost
                    state = states.machslide
                    image_index = 0
                }
            }
            if (wallspeed < 0 && place_meeting(x, (y + 12), obj_solid))
                wallspeed = 0
            if key_jump
            {
                key_jump = 0
                movespeed = 12
                scr_soundeffect(sfx_jump)
                state = states.mach2
                image_index = 0
                sprite_index = spr_walljumpstart
                if skateboarding
                    sprite_index = spr_clownjump
                if (!inbackground)
                    vsp = -11
                else
                    vsp = -5.5
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "S":
            if (windingAnim < 200)
                windingAnim++
            move = key_left + key_right
            suplexmove = 0
            wallspeed -= 0.25
            if inbackground
                vsp = (-wallspeed) / 2
            else
                vsp = (-wallspeed)
            if (wallspeed < 6)
            {
                state = states.jump
                vsp = -6
                sprite_index = spr_machfreefall
                movespeed = 9
            }
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (verticalbuffer <= 0 && place_meeting(x, (y - 1), obj_solid) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    scr_soundeffect(sfx_groundpound)
                    image_index = 0
                    state = states.Sjumpland
                    machhitAnim = 0
                }
                else if (!key_jump)
                {
                    state = states.bump
                    hsp = -2.5 * xscale
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            if (verticalbuffer <= 0 && (!(scr_solid((x + 14 * xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                trace("climbwall out")
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                if (wallspeed < 6)
                    wallspeed = 6
                if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                {
                    state = states.mach2
                    movespeed = wallspeed
                }
                else if (wallspeed >= 12)
                {
                    state = states.mach3
                    sprite_index = spr_mach4
                    movespeed = wallspeed
                }
            }
            if (wallspeed < 0 && place_meeting(x, (y + 12), obj_solid))
                wallspeed = 0
            if key_jump
            {
                key_jump = 0
                movespeed = 6 + wallspeed / 2
                scr_soundeffect(sfx_jump)
                state = states.mach2
                image_index = 0
                sprite_index = spr_walljumpstart
                if skateboarding
                    sprite_index = spr_clownjump
                if (!inbackground)
                    vsp = -11
                else
                    vsp = -5.5
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "M":
            if (windingAnim < 200)
                windingAnim++
            audio_stop_sound(sfx_mach3M)
            move = key_left + key_right
            suplexmove = 0
            if inbackground
                vsp = (-wallspeed) / 2
            else
                vsp = (-wallspeed)
            if (wallspeed < 20)
                wallspeed += 0.09
            if (wallspeed < 7)
                wallspeed += 0.065
            else if (wallspeed < 25)
                wallspeed += 0.15
            if (wallspeed < 0)
            {
                if (mach4mode == 0)
                {
                    if (isswimming == false)
                        movespeed += 0.2
                    else
                        movespeed += 0.05
                }
                else if (isswimming == false)
                    movespeed += 0.4
                else
                    movespeed += 0.1
            }
            if place_meeting(x, (y + 1), obj_solid)
                wallspeed = 6
            crouchslideAnim = 1
            if (vsp < -5)
                sprite_index = spr_machclimbwall
            else
            {
                sprite_index = spr_clingwall
                if (isswimming == false)
                    wallspeed += 0.15
            }
            if ((!key_attack) && (!skateboarding))
            {
                state = states.normal
                movespeed = 0
                railmovespeed = 6
                raildir = (-xscale)
            }
            if (verticalbuffer <= 0 && place_meeting(x, (y - 1), obj_solid) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    scr_soundeffect(sfx_groundpound)
                    image_index = 0
                    state = states.Sjumpland
                    machhitAnim = 0
                }
                else if (!key_jump)
                {
                    state = states.shoulderbash
                    hsp = -2.5 * xscale
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            if (verticalbuffer <= 0 && (!(scr_solid((x + 14 * xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                trace("climbwall out")
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                if (wallspeed < 6)
                    wallspeed = 6
                if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                {
                    state = states.shoulderbash
                    movespeed = wallspeed
                    sprite_index = spr_pepperman_shoulderloop
                }
                else if (wallspeed >= 12)
                {
                    state = states.shoulderbash
                    sprite_index = spr_pepperman_shoulderloop
                    movespeed = wallspeed
                }
            }
            if (wallspeed < 0 && place_meeting(x, (y + 12), obj_solid))
                wallspeed = 0
            if key_jump
            {
                key_jump = 0
                movespeed = 12
                scr_soundeffect(sfx_jump)
                state = states.shoulderbash
                image_index = 0
                sprite_index = spr_pepperman_shoulderstart
                if skateboarding
                    sprite_index = spr_clownjump
                if (!inbackground)
                    vsp = -11
                else
                    vsp = -5.5
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "V":
            if (windingAnim < 200)
                windingAnim++
            move = key_left + key_right
            suplexmove = 0
            if inbackground
                vsp = (-wallspeed) / 2
            else
                vsp = (-wallspeed)
            if (wallspeed > -7)
                wallspeed -= 0.4
            if (wallspeed < -7)
                wallspeed = -7
            if (hyperpeppino == 1)
            {
                if (wallspeed < 24)
                    wallspeed += 0.15
            }
            if (wallspeed < 0)
            {
                if (mach4mode == 0)
                {
                    if (mach4mode == 0)
                    {
                        if (isswimming == false)
                            movespeed += 0.25
                        else
                            movespeed += 0.1
                    }
                    else if (isswimming == false)
                        movespeed += 0.45
                    else
                        movespeed += 0.15
                }
            }
            crouchslideAnim = 1
            if (vsp < -5)
                sprite_index = spr_machclimbwall
            else
            {
                sprite_index = spr_clingwall
                if (isswimming == false)
                    wallspeed += 0.15
            }
            if ((!key_attack) && climbbuffer == 0 && (!skateboarding))
            {
                state = states.normal
                movespeed = 0
                railmovespeed = 6
                raildir = (-xscale)
            }
            if (verticalbuffer <= 0 && place_meeting(x, (y - 1), obj_solid) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    scr_soundeffect(sfx_groundpound)
                    image_index = 0
                    state = states.Sjumpland
                    machhitAnim = 0
                }
                else if (!key_jump)
                {
                    state = states.bump
                    hsp = -2.5 * xscale
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            if (verticalbuffer <= 0 && (!(scr_solid((x + 14 * xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                trace("climbwall out")
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                if (wallspeed < 6)
                    wallspeed = 6
                if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                {
                    state = states.mach2
                    movespeed = wallspeed
                }
                else if (wallspeed >= 12)
                {
                    state = states.mach3
                    sprite_index = spr_mach4
                    movespeed = wallspeed
                }
                if (move != xscale && move != 0)
                {
                    scr_soundeffect(sfx_machslideboost)
                    sprite_index = spr_mach3boost
                    state = states.machslide
                    image_index = 0
                }
            }
            if (wallspeed < 0 && place_meeting(x, (y + 12), obj_solid))
                wallspeed = 0
            if key_jump
            {
                key_jump = 0
                movespeed = 8
                scr_soundeffect(sfx_jump)
                state = states.mach2
                image_index = 0
                sprite_index = spr_walljumpstart
                if skateboarding
                    sprite_index = spr_clownjump
                if (!inbackground)
                    vsp = -12
                else
                    vsp = -6
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "N":
            scr_soundeffect(sfx_wallbounce)
            audio_stop_sound(sfx_mach2N)
            jumpstop = 0
            vsp = bounceheight
            movespeed = 0
            bounceheight += 2.5
            state = states.walljump
            sprite_index = spr_playerN_walljump
            image_index = 0
            with (instance_create(x, y, obj_noisehitfx))
                image_xscale = other.xscale
            break
        case "D":
            if key_jump
            {
                state = states.pogo
                sprite_index = spr_playerN_pogostart
                pogospeed = movespeed
                vsp = -11
            }
            hsp = movespeed * xscale
            if place_meeting((x + xscale), y, obj_solid)
            {
                xscale = (-xscale)
                state = states.climbwall
                sprite_index = spr_playerN_noisebombspinjump
                scr_soundeffect(sfx_groundpound)
                instance_create((x + 16 * xscale), y, obj_bangeffect)
                if key_up
                    vsp = -14
                else
                    vsp = 7
                if (movespeed < 18)
                    movespeed += 1
            }
            if key_down2
            {
                sprite_index = spr_dive
                scr_soundeffect(sfx_dive)
                state = states.tumble
                vsp = 10
            }
            if grounded
            {
                state = states.mach2
                image_index = 0
                sprite_index = spr_rollgetup
            }
            break
        case "NE":
            move = key_left + key_right
            suplexmove = 0
            vsp = (-wallspeed)
            wallspeed -= 0.25
            if (wallspeed < 2)
            {
                state = states.jump
                vsp = 0
            }
            if key_jump
            {
                key_jump = 0
                movespeed = 8
                scr_soundeffect(sfx_jump)
                state = states.mach2
                image_index = 0
                sprite_index = spr_walljumpstart
                vsp = -11
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            if (verticalbuffer <= 0 && place_meeting(x, (y - 1), obj_solid) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    scr_soundeffect(sfx_groundpound)
                    image_index = 0
                    state = states.Sjumpland
                    machhitAnim = 0
                }
                else if (!key_jump)
                {
                    state = states.bump
                    hsp = -2.5 * xscale
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            if (!inbackground)
            {
                if (verticalbuffer <= 0 && (!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
                {
                    trace("climbwall out")
                    instance_create(x, y, obj_jumpdust)
                    vsp = 0
                    ledge_bump(32)
                    if (wallspeed < 6)
                        wallspeed = 6
                    if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                    {
                        state = states.mach2
                        movespeed = wallspeed
                    }
                    else if (wallspeed >= 12)
                    {
                        state = states.mach3
                        sprite_index = spr_mach4
                        movespeed = wallspeed
                    }
                }
                else if place_meeting((x + 32 * xscale), (y - 64), obj_bgsolid)
                {
                    if (verticalbuffer <= 0 && (!(scr_solid((x + movespeed * xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
                    {
                        trace("climbwall out")
                        instance_create(x, y, obj_jumpdust)
                        vsp = 0
                        ledge_bump(32)
                        if (wallspeed < 6)
                            wallspeed = 6
                        if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                        {
                            state = states.mach2
                            movespeed = wallspeed
                        }
                        else if (wallspeed >= 12)
                        {
                            state = states.mach3
                            sprite_index = spr_mach4
                            movespeed = wallspeed
                        }
                    }
                }
            }
            break
    }

    if place_meeting((x + xscale * 4), y, obj_wallslick)
    {
        if (wallspeed > 4)
            wallspeed = 4
        wallspeed -= 0.7
        if place_meeting(x, (y + 1), obj_platform)
            state = states.normal
    }
    return;
}

