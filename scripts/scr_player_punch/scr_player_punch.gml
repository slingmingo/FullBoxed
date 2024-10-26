function scr_player_punch() //gml_Script_scr_player_punch
{
    if (place_meeting((x + xscale), y, obj_solid) && sprite_index == spr_player_kungfujump)
        movespeed = -6
    if (sprite_index == spr_uppercut && image_index < 1 && (!grounded) && vsp > -1)
    {
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
    }
    if (sprite_index == spr_uppercut || sprite_index == spr_uppercutend)
    {
        move = key_left + key_right
        landAnim = 1
        jumpstop = 0
        image_speed = 0.4
        hsp = movespeed
        if place_meeting((x + movespeed), y, obj_solid)
            movespeed /= 1.1
        if (move != 0)
        {
            if (movespeed > -7 && movespeed < 7)
                dir = move
            if (move == 1)
                movespeed += 0.5
            if (move == -1)
                movespeed -= 0.5
            if (movespeed < -7)
                movespeed += 0.5
            if (movespeed > 7)
                movespeed -= 0.5
        }
        if (movespeed > 18)
            movespeed -= 0.1
        if (movespeed < -18)
            movespeed += 0.1
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_uppercut)
            sprite_index = spr_uppercutend
        if (grounded && vsp > 0 && (sprite_index == spr_uppercut || sprite_index == spr_uppercutend))
        {
            if (hsp != 0)
            {
                dir = sign(hsp)
                xscale = dir
            }
            movespeed = abs(movespeed)
            movespeed /= 1.5
            if (vsp > 0)
                state = states.normal
        }
        if (punch_afterimage > 0)
            punch_afterimage--
        else
        {
            punch_afterimage = 5
            create_blue_afterimage(x, y, sprite_index, image_index, xscale)
        }
    }
    else
    {
        if (sprite_index == spr_freefallcancel || sprite_index == spr_Sjumpcancel)
        {
            if (key_down && fightball == 0 && (!(place_meeting(x, y, obj_dashpad))))
            {
                with (instance_create(x, y, obj_jumpdust))
                    image_xscale = other.xscale
                flash = 0
                flash = 0
                state = states.tumble
                vsp = 10
                image_index = 0
                sprite_index = spr_dive
                scr_soundeffect(sfx_dive)
            }
        }
        switch character
        {
            case "P":
            case "N":
                move = key_left + key_right
                landAnim = 1
                jumpstop = 0
                if (breakdance > 0)
                    breakdance--
                if (move != 0)
                {
                    if (move != xscale && movespeed > -6)
                    {
                        if (sprite_index != spr_player_kungfujump)
                            movespeed -= 1
                        else
                            movespeed -= 0.1
                    }
                    else if (move == xscale && movespeed < 6 && sprite_index == spr_player_kungfujump)
                        movespeed += 0.2
                }
                hsp = movespeed * xscale
                var _kungfuground = (sprite_index == spr_player_kungfu1 || sprite_index == spr_player_kungfu2 || sprite_index == spr_player_kungfu3 || sprite_index == spr_shotgunsuplexdash)
                var _Sjumpcancel = (sprite_index == spr_player_Sjumpcancel || sprite_index == spr_player_Sjumpcancelland || sprite_index == spr_player_Sjumpcancelslide)
                if (_kungfuground && image_index > 7 && (!key_attack) && movespeed > 0)
                    movespeed -= 0.5
                if (floor(image_index) == (image_number - 1))
                {
                    switch sprite_index
                    {
                        case spr_player_kungfu1:
                        case spr_playerS_machslideend:
                        case spr_playicon:
                        case spr_shotgunsuplexdash:
                            state = states.normal
                            if (move != xscale && move != 0)
                                movespeed = 2
                            break
                        case spr_noiseboulder:
                            sprite_index = spr_player_kungfuair1
                            break
                        case sprite1122:
                            sprite_index = spr_player_kungfuair2
                            break
                        case bg_wasteyardinterior:
                            sprite_index = spr_player_kungfuair3
                            break
                        case spr_pizzaball:
                            sprite_index = spr_player_Sjumpcancelslide
                            break
                    }

                }
                if ((!_kungfuground) && (!_Sjumpcancel))
                {
                    if (grounded && vsp >= 0)
                        state = states.normal
                }
                if _Sjumpcancel
                {
                    if (grounded && vsp > 0)
                    {
                        if (sprite_index == spr_player_Sjumpcancel)
                        {
                            canceldiving = 1
                            sprite_index = spr_player_Sjumpcancelland
                            image_index = 0
                        }
                        if key_attack
                        {
                            if (movespeed >= 12)
                                state = states.mach3
                            else
                                state = states.mach2
                            sprite_index = spr_rollgetup
                            image_index = 0
                        }
                        else if (movespeed > 6)
                        {
                            state = states.machslide
                            sprite_index = spr_machslidestart
                            image_index = 0
                        }
                        else
                            state = states.tumble
                    }
                    if (sprite_index == spr_player_Sjumpcancelslide)
                        image_speed = abs(movespeed) / 15
                }
                if (sprite_index != spr_player_kungfujump && place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_slope))))
                {
                    sprite_index = spr_climbwall
                    image_index = 0
                    state = states.climbwall
                }
                if (punch_afterimage > 0)
                    punch_afterimage--
                else
                {
                    punch_afterimage = 5
                    create_blue_afterimage(x, y, sprite_index, image_index, xscale)
                }
                if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
                {
                    with (instance_create(x, y, obj_dashcloud2))
                        image_xscale = other.xscale
                }
                break
        }

    }
    return;
}

