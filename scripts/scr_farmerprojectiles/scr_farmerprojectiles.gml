function scr_farmerpeasanto_projectile(argument0, argument1) //gml_Script_scr_farmerpeasanto_projectile
{
    with (argument0)
    {
        if (sprite_index != spr_haystackburning && sprite_index != spr_haystackburningup)
        {
            sprite_index = spr_haystackburningup
            image_index = 0
            state = states.normal
            return 1;
        }
    }
    return 0;
}

function scr_farmer2_projectile(argument0, argument1) //gml_Script_scr_farmer2_projectile
{
    with (argument0)
    {
        x_to = x + 64 * argument1.image_xscale
        dir = argument1.image_xscale
    }
    return 1;
}

function scr_farmer3_projectile(argument0, argument1) //gml_Script_scr_farmer3_projectile
{
    with (argument0)
    {
        x_to = x + 64 * (-argument1.image_xscale)
        dir = (-argument1.image_xscale)
    }
    return 1;
}

function scr_shoot_farmerprojectile() //gml_Script_scr_shoot_farmerprojectile
{
    if global.hasfarmer[farmerpos]
    {
        var inst = obj_farmerpeasantoprojectile
        if (farmerpos == 1)
            inst = obj_farmer2projectile
        else if (farmerpos == 2)
            inst = obj_mrstickblock
        with (instance_create(x, y, inst))
        {
            image_xscale = other.xscale
            hsp = 20 * image_xscale
        }
    }
    return;
}

function scr_change_farmers() //gml_Script_scr_change_farmers
{
    var i = 0
    while (i < 3)
    {
        farmerpos++
        if (farmerpos > (array_length(global.hasfarmer) - 1))
            farmerpos = 0
        if global.hasfarmer[farmerpos]
            break
    }
    farmer_rearrange()
    return;
}

