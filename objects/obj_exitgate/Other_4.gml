if (ds_list_find_index(global.saveroom, id) != -1 && global.panic == 0)
{
    image_index = 0
    lastroom = room
    global.leveltorestart = room
    with (obj_player)
    {
        x = roomstartx
        y = roomstarty
    }
}
if (ds_list_find_index(global.baddieroom, id) != -1 && drop)
{
    y = drop_y
    dropstate = states.idle
    hand_y = -100
}
