balloony += movespeed
imindex += 0.35
if (y < -50)
{
    instance_destroy()
    instance_create(0, 0, obj_creditsballoon)
}
