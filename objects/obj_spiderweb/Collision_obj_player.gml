with (obj_player)
{
    if (state != states.spiderweb)
    {
        state = states.spiderweb
        webID = instance_nearest(x, y, obj_spiderweb).id
    }
}
