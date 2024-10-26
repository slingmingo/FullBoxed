function scr_player_ladder() //gml_Script_scr_player_ladder
{
    hsp = movespeed * xscale
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    turning = 0
    jumpstop = 0
    move = key_left + key_right
    if place_meeting(x, y, obj_climbwall)
    {
        if (move != 0)
        {
            xscale = move
            if (movespeed < 9)
                movespeed += 0.5
            if (movespeed < 10)
                sprite_index = spr_Ladder
            else
                sprite_index = spr_player_hangslide
        }
        else if (move == 0)
        {
            if ((!key_up) && (!key_down))
                sprite_index = spr_Ladder
            if (movespeed > 0)
                movespeed -= 0.5
            else if (movespeed < 0)
                movespeed = 0
        }
    }
    else if (!(place_meeting(x, y, obj_climbwall)))
    {
        movespeed = 0
        hsp = 0
    }
    if (key_up && hooked == 0)
    {
        sprite_index = spr_laddermove
        if (vsp > -7)
            vsp = -6
        if (vsp > -9)
            vsp -= 0.1
        image_speed = 0.35
    }
    else if (key_down && hooked == 0)
    {
        sprite_index = spr_ladderdown
        if (vsp < 10)
            vsp += 0.5
        if (vsp > 10)
            vsp -= 0.5
        image_speed = -0.35
    }
    else
    {
        if (place_meeting(x, y, obj_climbwall) && move == 0)
            sprite_index = spr_Ladder
        else
            sprite_index = spr_Ladder
        vsp = 0
    }
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    if ((!(place_meeting(x, y, obj_climbwall))) && (!(place_meeting(x, y, obj_ladder))))
    {
        landAnim = 0
        jumpAnim = 0
        state = states.normal
        image_index = 0
        vsp = 0
    }
    if key_jump
    {
        sprite_index = spr_jump
        ladderbuffer = 20
        jumpAnim = 1
        if (movespeed < 8)
            state = states.jump
        else
            state = states.mach2
        if key_down
            vsp = 5
        else
            vsp = -9
        image_index = 0
    }
    if (key_down && grounded && (!(place_meeting(x, y, obj_platform))))
    {
        state = states.normal
        image_index = 0
    }
    return;
}

