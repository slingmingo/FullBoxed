scr_getinput()
if four
    scroll -= 0.52
if (scroll < -1960)
{
    fade += 0.0045
    fade2 += 0.05
}
if (fade >= 1)
    instance_destroy()
if (flash > 0)
    flash -= 0.01
imindex += 0.05
if key_jump
{
    if (!popup)
    {
        popup = 1
        alarm[4] = 100
    }
    else
        instance_destroy()
}
