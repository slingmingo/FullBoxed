var _block = id
with (obj_player)
{
    if (state != states.gameover && place_meeting(x, (y + 1), _block))
    {
        if (!key_jump2)
            vsp = -10
        else
            vsp = -16
        sprite_index = spr_machfreefall
        if (state == states.tumble || state == states.freefall)
            state = states.jump
        _block.image_index = 0
        _block.image_speed = 0.35
    }
}
