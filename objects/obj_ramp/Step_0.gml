if used
    image_index = 1
else
    image_index = 0
var s = 16
if place_meeting(x, (y - s), obj_player)
{
    with (obj_player)
    {
        var by = 4
        if (state == states.mach3)
            by = 10
        var bx = 8
        if (state == states.mach3 || state == states.ratmounttumble)
            bx = 18
        if ((state == states.mach2 || state == states.ratmounttumble || state == states.trashroll || state == states.tumble || state == states.mach3 || state == states.trickjump) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, (y + s), other))
        {
            if (movespeed > 8)
            {
                vsp = -12
                if (movespeed < 12)
                    movespeed = 12
                sprite_index = spr_rampjump
                scr_soundeffect(sfx_rollgetup)
                image_index = 0
                if isgustavo
                {
                    sprite_index = spr_player_ratmountwalljump
                    state = states.ratmounttrickjump
                }
                else
                    state = states.trickjump
                if (!other.used)
                {
                    ramp = 1
                    other.used = 1
                }
                ramp_buffer = 16
                trace("trickjump")
            }
        }
    }
}
