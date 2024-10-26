if (!grounded)
{
    image_speed = 0
    if (grav != 0)
        yscale += 0.01
}
else if (floor(image_index) != 8)
    image_speed = 0.35
else
    image_speed = 0
if (grounded && landed == 0)
{
    yscale = 1
    scr_soundeffect(sfx_groundpound)
    landed = 1
}
vsp += grav
scr_collision()
