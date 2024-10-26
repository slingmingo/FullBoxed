if (!other.grabbable)
    return;
if (state != states.boxxedpepspin)
{
    if (state == states.spin || state == states.handstandjump || state == 276 || state == states.lungeattack || state == states.punch || state == 276)
    {
        if (other.state == states.normal && scr_transformationcheck() && (!cutscene) && state != states.bombgrab && (state == states.handstandjump || state == states.punch || state == states.lungeattack || state == states.spin || state == 276))
        {
            state = states.bombgrab
            image_index = 0
            sprite_index = spr_haulingstart
            other.defused = 1
            bombgrabID = other.id
            movespeed = 6
            with (other)
            {
                state = states.grabbed
                playerid = other.id
            }
        }
    }
}
else if (other.kickbuffer <= 0)
{
    other.vsp = -9
    other.movespeed = 7
    other.image_xscale = xscale
    other.kickbuffer = 15
    other.y--
    other.defused = 1
}
