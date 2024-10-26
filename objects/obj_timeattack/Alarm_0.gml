if (room != rank_room)
{
    global.taseconds -= 1
    if (global.collect >= 5)
        global.collect -= 5
    if instance_exists(obj_player2)
    {
        if (global.collectN >= 5)
            global.collectN -= 5
    }
    if (global.taseconds < 0)
    {
        global.taseconds = 59
        global.taminutes -= 1
    }
    if (global.timedgate == 1 || global.miniboss == 1)
    {
        global.atseconds -= 1
        if (global.atseconds < 0)
        {
            global.taseconds = 59
            global.taminutes -= 1
        }
    }
    if (global.taminutes < 0)
    {
        global.taseconds = 0
        global.taminutes = 0
    }
    alarm[0] = 60
}
