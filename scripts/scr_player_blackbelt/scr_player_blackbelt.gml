function scr_player_blackbelt() //gml_Script_scr_player_blackbelt
{
    reboundvsp = 0
    hsp = movespeed
    move = key_left + key_right
    if (movespeed == 0 && sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfu3 && sprite_index != spr_player_kungfuair1 && sprite_index != spr_player_kungfuair2 && sprite_index != spr_player_kungfuair3)
        movespeed = 9 * xscale
    if (grounded && sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfu3 && sprite_index != spr_player_kungfuair1 && sprite_index != spr_player_kungfuair2 && sprite_index != spr_player_kungfuair3 && sprite_index != spr_player_kungfuair1transition && sprite_index != spr_player_kungfuair2transition && sprite_index != spr_player_kungfuair3transition)
        sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
    if ((!grounded) && sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfu3 && sprite_index != spr_player_kungfuair1 && sprite_index != spr_player_kungfuair2 && sprite_index != spr_player_kungfuair3 && sprite_index != spr_player_kungfuair1transition && sprite_index != spr_player_kungfuair2transition && sprite_index != spr_player_kungfuair3transition)
        sprite_index = choose(spr_player_kungfuair1, spr_player_kungfuair2, spr_player_kungfuair3)
    if (punch_afterimage > 0)
        punch_afterimage--
    else
    {
        punch_afterimage = 5
        create_blue_afterimage(x, y, sprite_index, image_index, xscale)
    }
    hsp = movespeed
    if place_meeting((x + xscale), y, obj_solid)
    {
        state = states.punch
        sprite_index = spr_player_kungfujump
        vsp = -6
        movespeed = (-movespeed) / 2
    }
    if (grounded && key_jump)
    {
        state = states.punch
        sprite_index = spr_player_kungfujump
        image_speed = -0.5
        if (movespeed < 0)
            movespeed = (-movespeed)
        vsp = -11
    }
    if (move != 0)
    {
        if (movespeed > -11 && movespeed < 11)
            dir = move
        if (move == 1)
            movespeed += 0.5
        if (move == -1)
            movespeed -= 0.5
        if (movespeed < -11)
            movespeed += 0.5
        if (movespeed > 11)
            movespeed -= 0.5
    }
    if (movespeed > 20)
        movespeed -= 0.1
    if (movespeed < -20)
        movespeed += 0.1
    if (grounded && sprite_index != spr_player_kungfujump)
        image_speed = 0.35
    else if (sprite_index != spr_player_kungfujump)
        image_speed = 0.45
    if (floor(image_index) == (image_number - 1))
    {
        if (grounded && sprite_index != spr_player_kungfujump)
        {
            if (move != 0)
                state = (104 && sprite_index == spr_mach)
            else
                state = states.normal
            sprite_index = spr_move
            if (movespeed < 0)
                movespeed = (-movespeed)
        }
        else
        {
            switch sprite_index
            {
                case spr_player_kungfuair1transition:
                    sprite_index = spr_player_kungfuair1
                    break
                case spr_player_kungfuair2transition:
                    sprite_index = spr_player_kungfuair2
                    break
                case spr_player_kungfuair3transition:
                    sprite_index = spr_player_kungfuair3
                    break
            }

        }
    }
    if (grounded && (sprite_index == spr_player_kungfuair1 || sprite_index == spr_player_kungfuair1transition || sprite_index == spr_player_kungfuair2 || sprite_index == spr_player_kungfuair2transition || sprite_index == spr_player_kungfuair3 || sprite_index == spr_player_kungfuair3transition || sprite_index == spr_player_kungfujump))
    {
        if (move != 0)
            state = (104 && sprite_index == spr_mach)
        else
            state = states.normal
        if (movespeed < 0)
            movespeed = (-movespeed)
        landAnim = 1
    }
    if (key_shoot2 && attacksleft > 0 && sprite_index != spr_player_kungfuair1transition && sprite_index != spr_player_kungfuair2transition && sprite_index != spr_player_kungfuair3transition)
    {
        attacksleft--
        state = states.blackbelt
        vsp -= 4
        if (move != 0)
            movespeed = 12 * xscale
        else
            movespeed = 5 * dir
        landAnim = 0
        sprite_index = choose(spr_player_kungfuair1transition, spr_player_kungfuair2transition, spr_player_kungfuair3transition)
        scr_soundeffect(sfx_suplexdash)
        image_index = 0
    }
}

