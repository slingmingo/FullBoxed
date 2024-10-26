if (obj_player.key_up2 && obj_player.grounded && (!held))
{
    with (obj_player)
    {
        state = states.titlescreen
        xscale = 1
        movespeed = 0
        image_speed = 0.3
        sprite_index = spr_phonestart
        other.sprite_index = spr_phonepicked
        scr_soundeffect(sfx_stompenemy)
        other.held = true
    }
}
