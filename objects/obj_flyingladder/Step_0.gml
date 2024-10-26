if hooked
{
    y -= movespeed
    if (movespeed < 10)
        movespeed += 0.5
    with (obj_player)
    {
        if (state == states.ladder && place_meeting(x, y, other))
            y -= 5
    }
    if (y < (starty - max_height))
        instance_destroy()
    with (obj_player1)
    {
        if hooked
        {
            x = other.x + 16
            y = other.y + 40
        }
    }
}
