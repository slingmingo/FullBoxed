function scr_player_balloon() //gml_Script_scr_player_balloon
{
    sprite_index = spr_player_ratballoon
    hsp = movespeed
    move = key_left + key_right
    if (vsp > -7)
        vsp += -0.65
    if (vsp > 0)
        vsp += ((-vsp) / 8)
    if (move != 0)
        movespeed = Approach(movespeed, (move * 6), 0.35)
    else
        movespeed = Approach(movespeed, 0, 0.35)
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
        movespeed = 0
    if (balloonbuffer > 0)
        balloonbuffer--
    else
    {
        create_particle(x, (y - 20), 9, 0)
        instance_create(x, (y - 20), obj_balloongrabbableeffect)
        state = states.jump
        sprite_index = spr_fall
        jumpAnim = 0
    }
    if key_jump
    {
        create_particle(x, (y - 20), 9, 0)
        instance_create(x, (y - 20), obj_balloongrabbableeffect)
        state = states.jump
        sprite_index = spr_jump
        image_index = 0
        jumpAnim = 1
        movespeed = abs(movespeed)
        vsp = -11
        scr_soundeffect(sfx_ratdeflate)
        jumpstop = 0
    }
    return;
}

