y += vsp
vsp += grav
if place_meeting(x, y, obj_swimwater)
    vsp -= 0.8
if place_meeting(x, (y - 1), obj_player)
{
    if (sinky < 10)
        sinky += 2
    obj_player.vsp = 12
}
else
{
    if (sinky > 0)
        sinky -= 1
    if (sinky < 0)
        sinky = 0
}
