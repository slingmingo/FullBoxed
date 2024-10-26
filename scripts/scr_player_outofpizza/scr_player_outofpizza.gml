function scr_player_outofpizza() //gml_Script_scr_player_outofpizza
{
    image_speed = 0.35
    hsp = movespeed * xscale
    if (place_meeting((x + xscale), y, obj_solid) && (!grounded))
        xscale = (-xscale)
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_outofpizza1)
            sprite_index = spr_outofpizza2
        if (sprite_index == spr_outofpizza3)
            sprite_index = spr_outofpizza4
    }
    if (grounded && sprite_index == spr_outofpizza2)
    {
        sprite_index = spr_outofpizza3
        image_index = 0
    }
    return;
}

