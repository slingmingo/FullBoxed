if (!is_solid)
    shotgun = 1
if (shotgun == 1)
{
    with (instance_place((x + spd), y, obj_shotgunblock))
        instance_destroy()
}
if (shotgun == 1)
{
    with (instance_place(x, (y - spdh), obj_shotgunblock))
        instance_destroy()
}
if (brick == 1)
{
    x = brickid.x
    y = brickid.y
}
else
{
    x += (image_xscale * spd)
    y += (-spdh)
}
with (instance_place((x + image_xscale * spd), y, obj_destructibles))
{
    if (object_index != obj_onewaybigblock)
        instance_destroy()
}
if (place_meeting((x + image_xscale * spd), y, obj_solid) && (!(place_meeting((x + image_xscale * spd), y, obj_shotgunblock))) && (!(place_meeting((x + image_xscale * spd), y, obj_destructibles))))
    instance_destroy()
if (sprite_index == spr_mortprojectile)
{
    with (instance_place(x, (y - spdh), obj_mortblock))
        instance_destroy()
}
if (blur_effect == 0)
{
    blur_effect = 2
    create_blur_afterimage(x, y, sprite_index, (image_index - 1), image_xscale)
}
else if (blur_effect != -1)
    blur_effect--
