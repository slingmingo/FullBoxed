event_inherited()
if (state == states.stun)
{
    if (!(scr_solid(x, y)))
        scr_collision()
    else
    {
        x += hsp
        y += vsp
    }
}
