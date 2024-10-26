function scr_cheesedragon_flames() //gml_Script_scr_cheesedragon_flames
{
    if (y != 353)
        y = lerp(y, 353, 0.2)
    if (sprite_index == spr_cheesedragon_hydrate || (sprite_index == spr_cheesedragon_flames && image_index < 12))
        vulnerable = 1
    if (xfinal == 725)
        image_xscale = 1
    else
        image_xscale = -1
    if (sprite_index == spr_cheesedragon_flames && (floor(image_index) == (image_number - 16) || floor(image_index) == (image_number - 22) || floor(image_index) == (image_number - 28)))
    {
        if (canspawn == 1)
        {
            with (instance_create(x, (y + 75), obj_kelvin))
                image_xscale = other.image_xscale
        }
        canspawn = 0
        alarm[1] = 5
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_flames)
    {
        image_index = 0
        vsp = 0
        alarm[1] = 0
        sprite_index = spr_cheesedragon_hydrate
        vulnerable = 1
        if (side == 1)
            side = 0
        else
            side = 1
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_hydrate)
    {
        state = "idle"
        sprite_index = spr_cheesedragon_idle
    }
}

