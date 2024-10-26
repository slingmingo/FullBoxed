function scr_player_cheesepep() //gml_Script_scr_player_cheesepep
{
    key_particles = 0
    mach2 = 0
    momemtum = 0
    alarm[5] = 2
    alarm[7] = 60
    if (character == "N")
        mask_index = spr_crouchmask
    move = key_left + key_right
    if ((grounded && key_down && character == "P") || scr_solid_player(x, (y - 16)))
    {
        sprite_index = spr_cheesepep_stick
        mask_index = spr_crouchmask
        if (move != 0 && sprite_index != spr_cheesepepjumpstart)
        {
            xscale = move
            movespeed = Approach(movespeed, 4, 0.5)
        }
        else
            movespeed = Approach(movespeed, 0, 0.25)
        image_speed = movespeed / 15
    }
    else
    {
        if (character != "N")
            mask_index = spr_player_mask
        else
            mask_index = spr_crouchmask
        if (sprite_index == spr_cheesepep_stick)
            sprite_index = spr_cheesepep_idle
    }
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = xscale * movespeed
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = xscale * movespeed + _railinst.movespeed * _railinst.dir
    }
    if key_jump
        input_buffer_jump = 0
    if (grounded && move != 0 && sprite_index == spr_cheesepepidle)
        sprite_index = spr_cheesepepwalk
    else if (grounded && move == 0 && sprite_index == spr_cheesepepwalk)
        sprite_index = spr_cheesepepidle
    if (move != 0 && sprite_index != spr_cheesepepjumpstart && sprite_index != spr_cheesepep_stick)
    {
        xscale = move
        movespeed = Approach(movespeed, 5, 0.5)
    }
    else
        movespeed = Approach(movespeed, 0, 0.25)
    if (sprite_index != spr_cheesepep_stick)
        image_speed = 0.35
    if (grounded && (floor(image_index) % 4) == 0 && hsp != 0)
        create_debris(x, (y + 43), spr_slimedebris)
    if (!grounded)
    {
        state = states.cheesepepjump
        sprite_index = spr_cheesepepfall
        jumpstop = 1
        movespeed = xscale * movespeed
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepepland || sprite_index == spr_cheesepepintro)
        {
            if (move != 0)
                sprite_index = spr_cheesepepwalk
            else
                sprite_index = spr_cheesepepidle
        }
    }
    if (input_buffer_jump < 8 && sprite_index != spr_cheesepepjumpstart && sprite_index != spr_cheesepepland && sprite_index != spr_cheesepep_stick)
    {
        image_index = 0
        sprite_index = spr_cheesepepjumpstart
    }
    if (sprite_index == spr_cheesepepjumpstart && floor(image_index) == (image_number - 1))
    {
        vsp = -11
        image_index = 0
        sprite_index = spr_cheesepepjump
        state = states.cheesepepjump
    }
    return;
}
