function scr_player_superslam() //gml_Script_scr_player_superslam
{
    if (sprite_index == spr_piledriver)
    {
        move = key_left + key_right
        hsp = move * movespeed
        vsp = vspmax
        image_speed = vsp / 6
        if (vspmax < 20)
            vspmax += 0.8
        if key_slap2
        {
            if (move != 0)
                move = xscale
            hsp = xscale * movespeed
            movespeed = hsp
            vsp /= 2
            state = states.finishingblow
            if (!key_up)
                sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
            else if key_up
                sprite_index = spr_uppercutfinishingblow
            image_index = 0
        }
    }
    else
    {
        move = 0
        hsp = 0
    }
    if (grounded && (!(place_meeting(x, (y + 1), obj_destructibles))) && sprite_index == spr_piledriver && vsp > 0)
    {
        scr_soundeffect(sfx_groundpound)
        sprite_index = spr_piledriverland
        jumpAnim = 1
        image_index = 0
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = 40 / room_speed
        }
        hsp = 0
        bounce = 0
        with (instance_create(x, (y + 35), obj_bangeffect))
            xscale = obj_player.xscale
        create_particle(x, y, 12, 0)
        freefallstart = 0
    }
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    machslideAnim = 1
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    if (sprite_index == spr_piledriverland && floor(image_index) == (image_number - 1))
    {
        vsp = -6
        state = states.jump
    }
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (floor(movespeed) == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (movespeed > 6)
        movespeed -= 0.1
    if (character == "N" && move != 0)
        xscale = move
    if (vsp < 0)
        image_speed = 0.35
    else
        image_speed = 0.5
    return;
}

