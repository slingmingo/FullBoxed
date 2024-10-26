var accel = 2
with (obj_player)
{
    if (room == rank_room && check_player_coop())
    {
        var tx = 480
        if (object_index == obj_player2)
            tx += 100
        var ty = 270
        var dir = point_direction(x, y, tx, ty)
        var lx = lengthdir_x(accel, dir)
        var ly = lengthdir_y(accel, dir)
        x = lerp(x, tx, 0.05)
        y = lerp(y, ty, 0.05)
    }
}
obj_camera.visible = false
if (fadealpha > 1)
{
    fadein = 1
    if (room != rank_room)
        room = rank_room
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
