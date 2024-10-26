function scr_player_coopflight() //gml_Script_scr_player_coopflight
{
    move = key_left + key_right
    movev = key_down - key_up
    hsp = movespeed
    vsp = vmovespeed
    sprite_index = spr_player_stomp
    if (vmovespeed > 16)
        vmovespeed = 16
    else
        vmovespeed += 0.3
    grav = 0.3
    image_speed = 0.35
    if (move != 0)
    {
        xscale = move
        if (movespeed < 8 && move == 1)
            movespeed += 0.3
        if (movespeed > -8 && move == -1)
            movespeed -= 0.3
    }
    else if (movespeed > 0)
        movespeed /= 1.1
    else
        movespeed /= 1.1
    if (movev != 0)
    {
        if (vmovespeed > -4 && movev == -1)
            vmovespeed -= 0.7
    }
    else if (vmovespeed > 0)
        vmovespeed /= 1.1
    else
        vmovespeed /= 1.1
    if key_jump
    {
        state = states.jump
        vsp = -8
        sprite_index = spr_jump
        obj_coopplayerfollow.jetpackflight = 0
        if (movespeed < 0)
            movespeed = (-movespeed)
    }
}

