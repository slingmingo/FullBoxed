function scr_player_hurt() //gml_Script_scr_player_hurt
{
    hsp = (-xscale) * movespeed
    if ((sprite_index == spr_hurtjump && place_meeting((x + xscale), y, obj_solid)) || (sprite_index == spr_hurt && place_meeting((x + (-xscale)), y, obj_solid)))
    {
        xscale = (-xscale)
        if (sprite_index == spr_hurtjump)
            movespeed = -6
        else
            movespeed = 6
    }
    freefallsmash = 0
    combo = 0
    mach2 = 0
    bounce = 0
    jumpAnim = 1
    dashAnim = 1
    if grounded
        landAnim = 0
    else
        landAnim = 1
    jumpstop = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    hit_connected = 0
    hurted = 1
    turning = 0
    skateboarding = 0
    alarm[5] = 2
    alarm[7] = 60
    audio_stop_sound(sfx_tornado)
    audio_stop_sound(sfx_tornadoair)
    if (grounded && vsp > 0)
    {
        movespeed = 0
        state = states.normal
    }
    if scr_solid((x + hsp), y)
        movespeed = 0
    image_speed = 0.35
    return;
}

