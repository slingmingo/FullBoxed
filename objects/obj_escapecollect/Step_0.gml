if (room == rm_editor)
    return;
if (global.collectsound < 10)
    global.collectsound += 1
if (distance_to_object(obj_player) < 10)
{
}
if place_meeting(x, y, obj_destructibles)
    depth = 102
else
    depth = 2
if (global.panic == 1)
{
    if ((!gotowardsplayer) && abs(distance_to_object(obj_player1)) < 25)
    {
        gotowardsplayer = 1
        scr_ghostcollectible()
    }
    if (gotowardsplayer == 1)
    {
        move_towards_point(obj_player.x, obj_player.y, movespeed)
        movespeed++
    }
}
