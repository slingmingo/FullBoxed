function scr_player_meteorpep() //gml_Script_scr_player_meteorpep
{
    mach2 = 0
    landAnim = 1
    vsp = 0
    if ((sprite_index == spr_meteorpep_impact || sprite_index == spr_meteorpep_start) && floor(image_index) == (image_number - 1))
        sprite_index = spr_meteorpep_flying
    if (sprite_index == spr_meteorpep_flying || sprite_index == spr_meteorpep_start || sprite_index == spr_meteorpep_slope)
    {
        if (movespeed <= 30)
            movespeed += 0.1
        if (movespeed < 15)
            movespeed = 15
        hsp = floor((-xscale) * movespeed)
    }
    else
        hsp = 0
    if ((!instance_exists(crazyruneffectid)) && sprite_index == spr_meteorpep_flying)
    {
        with (instance_create((x + movespeed * (-xscale)), y, obj_crazyrunothereffect))
        {
            playerid = other.object_index
            other.crazyruneffectid = id
            image_speed = 0.5
        }
    }
    if (place_meeting((x + (-xscale)), y, obj_solid) && hsp != 0)
    {
        movespeed = 0
        with (obj_baddie)
        {
            if point_in_camera(x, y, view_camera[0])
            {
                vsp = -7
                hsp = 0
            }
        }
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = 30 / room_speed
        }
        image_index = 0
        scr_soundeffect(sfx_groundpound)
        sprite_index = spr_meteorpep_land
    }
    else if (place_meeting((x + (-xscale)), (y + 5), obj_solid) && hsp != 0)
    {
        if (sprite_index == spr_meteorpep_flying)
        {
            sprite_index = spr_meteorpep_slope
            image_index = 0
        }
        else if (sprite_index != sprite_index == 1615)
            sprite_index = spr_meteorpep_flying
    }
    if (sprite_index == spr_meteorpep_land && floor(image_index) == (image_number - 1))
        state = states.normal
    image_speed = 0.35
    return;
}

