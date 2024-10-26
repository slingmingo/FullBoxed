drawing = place_meeting(x, y, obj_player)
scr_levelgatebg_run()
if drawing
{
    if (leveltitlealpha < 1)
        leveltitlealpha += 0.05
}
if ((!drawing) && leveltitlealpha > 0)
    leveltitlealpha -= 0.05
if place_meeting(x, y, obj_player)
{
    image_speed = 0.35
    with (obj_camera)
    {
        overgate = 1
        var target = other
    }
}
else
{
    with (obj_camera)
    {
        overgate = 0
        target = other
    }
    image_speed = 0
    image_index = 0
}
if (msg != "" && distance_to_object(obj_player) < 50)
{
    with (obj_tv)
    {
        message = other.msg
        showtext = 1
        alarm[0] = 2
    }
}
if (!drawing)
{
    var dis = 250
    bgalpha = distance_to_object(obj_player) / dis
    bgalpha -= 0.25
    if (bgalpha > 1)
        bgalpha = 1
    if (bgalpha < 0)
        bgalpha = 0
}
else
    bgalpha = Approach(bgalpha, 0, 0.1)
if (rank == "d")
    rankindex = 0
else if (rank == "c")
    rankindex = 1
else if (rank == "b")
    rankindex = 2
else if (rank == "a")
    rankindex = 3
else if (rank == "s")
    rankindex = 4
else if (rank == "p")
    rankindex = 5
