function scr_player_supersidejump() //gml_Script_scr_player_supersidejump
{
    movev = key_down - key_up
    movev = 0
    move = 0
    hsp = movespeed
    vsp = vmovespeed
    if (hyperpeppino == 0)
        state = states.mach2
    grav = 0
    image_speed = 0.35
    move = 0
    if (move != 0)
    {
        xscale = move
        if (movespeed < 18 && move == 1)
            movespeed += 0.7
        if (movespeed > -18 && move == -1)
            movespeed -= 0.7
    }
    else if (movespeed > 0)
        movespeed /= 1.2
    else
        movespeed /= 1.2
    if (movev != 0)
    {
        if (vmovespeed < 4 && movev == 1)
            vmovespeed += 0.5
        if (vmovespeed > -4 && movev == -1)
            vmovespeed -= 0.5
    }
    else if (vmovespeed > 0)
        vmovespeed /= 1.2
    else
        vmovespeed /= 1.2
    if (key_jump && (!(place_meeting(x, (y - 32), obj_solid))))
    {
        mask_index = spr_player_mask
        state = states.mach2
        sprite_index = spr_mach2jump
        if (movespeed < 0)
            movespeed = (-movespeed)
        vsp = -11
    }
    if place_meeting((x + movespeed), y, obj_solid)
        movespeed /= 1.2
    if place_meeting(x, (y + vmovespeed), obj_solid)
        vmovespeed /= 1.2
    if ((!instance_exists(obj_spinhitbox)) && move != 0)
    {
        var _playerid = obj_gamestarter
        with (instance_create(x, y, obj_spinhitbox))
            playerid = _playerid
    }
    else if instance_exists(obj_spinhitbox)
        instance_destroy(obj_spinhitbox)
}

