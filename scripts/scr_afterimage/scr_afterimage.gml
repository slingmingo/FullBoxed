function create_afterimage(argument0, argument1, argument2, argument3) //gml_Script_create_afterimage
{
    var q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: argument2,
        image_index: argument3,
        alarm: [15, 3, -1],
        image_blend: choose(global.afterimage_color1, global.afterimage_color2),
        image_xscale: obj_player.xscale,
        image_yscale: (obj_player.yscale * obj_player.scale_ys),
        identifier: 0,
        visible: true,
        alpha: 1
    }

    ds_list_add(global.afterimage_list, q)
    return q;
}

function create_heatattack_afterimage(argument0, argument1, argument2, argument3, argument4) //gml_Script_create_heatattack_afterimage
{
    var _velocity = 6
    with (create_afterimage(argument0, argument1, argument2, argument3))
    {
        identifier = 2
        alarm[1] = -1
        alarm[2] = -1
        alarm[0] = 8
        image_xscale = argument4
        hsp = _velocity
        vsp = 0
    }
    with (create_afterimage(argument0, argument1, argument2, argument3))
    {
        identifier = 2
        alarm[1] = -1
        alarm[2] = -1
        alarm[0] = 8
        image_xscale = argument4
        hsp = (-_velocity)
        vsp = 0
    }
    with (create_afterimage(argument0, argument1, argument2, argument3))
    {
        identifier = 2
        alarm[1] = -1
        alarm[2] = -1
        alarm[0] = 8
        image_xscale = argument4
        hsp = 0
        vsp = _velocity
    }
    with (create_afterimage(argument0, argument1, argument2, argument3))
    {
        identifier = 2
        alarm[1] = -1
        alarm[2] = -1
        alarm[0] = 8
        image_xscale = argument4
        hsp = 0
        vsp = (-_velocity)
    }
    return;
}

function create_firemouth_afterimage(argument0, argument1, argument2, argument3, argument4) //gml_Script_create_firemouth_afterimage
{
    with (create_afterimage(argument0, argument1, argument2, argument3))
    {
        identifier = 3
        alarm[0] = -1
        alarm[1] = -1
        alarm[2] = -1
        image_xscale = obj_player.xscale * obj_player.scale_xs
        image_yscale = obj_player.yscale * obj_player.scale_ys
        image_blend = make_color_rgb(248, 112, 24)
        alpha = 1.25
    }
    return;
}

function create_attack_afterimage(argument0, argument1, argument2, argument3, argument4) //gml_Script_create_attack_afterimage
{
    with (create_afterimage(argument0, argument1, argument2, argument3))
    {
        identifier = 3
        alarm[0] = -1
        alarm[1] = -1
        alarm[2] = -1
        image_xscale = argument4
        image_blend = make_color_rgb(200, 25, 25)
        alpha = 0.75
    }
    return;
}

function create_blue_afterimage(argument0, argument1, argument2, argument3, argument4) //gml_Script_create_blue_afterimage
{
    with (create_afterimage(argument0, argument1, argument2, argument3))
    {
        identifier = 4
        alarm[0] = -1
        alarm[1] = -1
        alarm[2] = -1
        image_xscale = argument4
        image_blend = make_color_rgb(44, 126, 228)
        alpha = 1
    }
    return;
}

function create_blur_afterimage(argument0, argument1, argument2, argument3, argument4) //gml_Script_create_blur_afterimage
{
    var b = create_afterimage(argument0, argument1, argument2, argument3)
    with (b)
    {
        identifier = 5
        alarm[0] = -1
        alarm[1] = -1
        alarm[2] = -1
        image_blend = c_white
        if obj_player.inbackground
            image_xscale = argument4 * 0.5
        else
            image_xscale = argument4
        if obj_player.inbackground
            image_yscale = 0.5
        else
            image_yscale = 1
        alpha = 0.8
        playerid = noone
    }
    return b;
}

function create_clown_afterimage(argument0, argument1, argument2, argument3, argument4) //gml_Script_create_clown_afterimage
{
    with (create_afterimage(argument0, argument1, argument2, argument3))
    {
        identifier = 6
        alarm[0] = -1
        alarm[1] = -1
        alarm[2] = -1
        image_xscale = argument4
        image_blend = make_color_rgb(255, 33, 175)
        alpha = 1.25
    }
    return;
}

function create_mach3effect(argument0, argument1, argument2, argument3) //gml_Script_create_mach3effect
{
    if (obj_player.character == "P")
    {
        global.mach_color1 = make_colour_rgb(96, 208, 72)
        global.mach_color2 = make_colour_rgb(248, 0, 0)
    }
    if (obj_player.character == "N")
    {
        global.mach_color1 = make_colour_rgb(20, 135, 255)
        global.mach_color2 = make_color_rgb(255, 200, 0)
    }
    if (obj_player.character == "V")
    {
        global.mach_color1 = make_colour_rgb(248, 0, 0)
        global.mach_color2 = make_colour_rgb(240, 115, 15)
    }
    if (obj_player.character == "M")
    {
        global.mach_color1 = make_colour_rgb(96, 208, 72)
        global.mach_color2 = make_colour_rgb(96, 175, 255)
    }
    if (obj_player.character == "D")
    {
        global.mach_color1 = make_colour_rgb(240, 115, 15)
        global.mach_color2 = make_colour_rgb(150, 15, 255)
    }
    if (obj_player.character == "NE")
    {
        global.mach_color1 = make_colour_rgb(96, 208, 72)
        global.mach_color2 = make_colour_rgb(165, 255, 85)
    }
    with (instance_create(argument0, argument1, obj_afterimage))
    {
        sprite_index = argument2
        image_index = argument3
        alarm[0] = 15
        image_blend = choose(global.mach_color1, global.mach_color2)
        if obj_player.inbackground
            image_xscale = obj_player.xscale * 0.5
        else
            image_xscale = obj_player.xscale
        if obj_player.inbackground
            image_yscale = 0.5
        identifier = 0
        visible = true
        if (obj_player.state != states.Sjump && obj_player.state != states.climbwall && obj_player.state != states.freefall && obj_player.sprite_index != spr_player_freefall && obj_player.sprite_index != spr_playerN_machfreefall2)
            image_alpha = obj_player1.movespeed / 12
        else if (obj_player.vsp < 0)
            image_alpha = (-obj_player.vsp) / 10
        else
            image_alpha = obj_player.vsp / 15
    }
    return;
}

