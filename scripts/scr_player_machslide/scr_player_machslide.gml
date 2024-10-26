function scr_player_machslide() //gml_Script_scr_player_machslide
{
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = xscale * movespeed
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = xscale * movespeed + _railinst.movespeed * _railinst.dir
    }
    move = key_right + key_left
    if (movespeed >= 0)
    {
        if (character != "NE")
            movespeed -= 0.3
        else
            movespeed -= 0.15
    }
    if (character == "S")
        movespeed -= 0.1
    if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_machslide
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_machslideboost || sprite_index == spr_mach3boost))
    {
        if (sprite_index == spr_machslideboost && (!grounded))
            sprite_index = spr_mach2boostfall
        if (sprite_index == spr_mach3boost && (!grounded))
            sprite_index = spr_mach3boostfall
        image_speed = 0.35
    }
    else
        image_speed = 0.35
    landAnim = 0
    if (floor(movespeed) <= 6 && character == "S" && (sprite_index == spr_machslide || sprite_index == spr_crouchslide))
    {
        state = states.normal
        image_index = 0
        if (sprite_index == spr_machslide)
            machslideAnim = 1
    }
    if (floor(movespeed) <= 4.5 && (sprite_index == spr_machslide || sprite_index == spr_crouchslide))
    {
        if (character != "NE" && floor(movespeed) <= 1)
        {
            state = states.normal
            image_index = 0
            if (sprite_index == spr_machslide)
                machslideAnim = 1
            movespeed = 0
        }
        if (character == "NE")
        {
            state = states.normal
            image_index = 0
            if (sprite_index == spr_machslide)
                machslideAnim = 1
        }
    }
    if (place_meeting((x + xscale), y, obj_solid) && (sprite_index == spr_machslide || sprite_index == spr_machslidestart))
    {
        sprite_index = spr_wallsplat
        scr_soundeffect(sfx_bumpwall)
        audio_stop_sound(sfx_machslide)
        state = states.bump
        image_index = 0
    }
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_machslideboost || sprite_index == spr_mach2boostfall) && grounded)
    {
        hsp = 0
        image_index = 0
        xscale *= -1
        movespeed = 8
        state = states.mach2
    }
    if ((floor(image_index) == (image_number - 1) && (sprite_index == spr_mach3boost || sprite_index == spr_mach3boostfall) && grounded) || (sprite_index == spr_mach3boostfall && grounded))
    {
        if (!launch)
        {
            hsp = 0
            sprite_index = spr_dashpadmach
            image_index = 0
            xscale *= -1
            if (character == "NE")
                movespeed = 4
            else
                movespeed = 12
            state = states.mach3
        }
        else
        {
            xscale *= -1
            sprite_index = spr_dashpadmach
            image_index = 0
            state = states.mach3
            if (character == "NE")
                movespeed = 6
            else
                movespeed = 14
            launched = 1
            launch = 0
            launch_buffer = 20
        }
    }
    if (sprite_index == spr_player_crouchslide && movespeed == 0 && grounded)
    {
        facehurt = 1
        state = states.normal
        sprite_index = spr_facehurtup
    }
    if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
    {
        with (instance_create(x, y, obj_dashcloud2))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if ((!instance_exists(dashcloudid)) && grounded && place_meeting(x, (y + 1), obj_water))
    {
        with (instance_create(x, y, obj_dashcloud2))
        {
            sprite_index = spr_watereffect
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if (sprite_index == spr_machslideboost && (!grounded) && movespeed < 6)
        sprite_index = spr_mach2boostfall
    if (sprite_index == spr_mach3boost && (!grounded) && movespeed < 6)
        sprite_index = spr_mach3boostfall
    return;
}

