hsp = movespeed * (-image_xscale)
if place_meeting((x + 16 * (-image_xscale)), y, obj_solid)
    image_xscale = (-image_xscale)
x += hsp
y += vsp
if (floor(image_index) == (image_number - 1) && sprite_index == spr_kelvin_spawn)
    sprite_index = spr_kelvin_walk
if instance_exists(obj_flash)
    instance_destroy()
if (floor(image_index) == (image_number - 9) && sprite_index == spr_kelvin_bonk)
{
    if (!instance_exists(obj_charcoalthrowable))
        instance_create(x, y, obj_charcoalthrowable)
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_kelvin_bonk)
    instance_destroy()
