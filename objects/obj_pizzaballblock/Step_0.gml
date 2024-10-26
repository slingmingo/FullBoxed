with (obj_player)
{
    if (place_meeting((x + xscale), y, other) && state == states.tauntmoves)
        instance_destroy(other)
}
with (obj_player)
{
    if (place_meeting(x, (y + 1), other) && state == states.tauntmoves)
        instance_destroy(other)
}
