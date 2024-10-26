scr_collide()
if (rolling == 1)
{
    image_speed = 0.7
    if grounded
    {
        vsp = -5
        sprite_index = spr_meatball_roll
        hsp = 12 * image_xscale
    }
    if place_meeting((x + image_xscale), y, obj_solid)
    {
        image_xscale = (-image_xscale)
        scr_soundeffect(sfx_bumpwall)
        instance_create((x + 64 * image_xscale), y, obj_bumpeffect)
    }
    if place_meeting((x + image_xscale), y, obj_spike)
        instance_destroy()
}
