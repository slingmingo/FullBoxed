function scr_checkPositionSolidAngle(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_scr_checkPositionSolidAngle
{
    if (argument6 == undefined)
        argument6 = (0 << 0)
    var point_a = 
    {
        x: argument0,
        y: argument1,
        targetX: argument0,
        targetY: argument1
    }

    var point_b = 
    {
        x: argument0,
        y: argument1,
        targetX: argument0,
        targetY: argument1
    }

    point_a.x += lengthdir_x(argument2, (90 + argument5))
    point_a.y += lengthdir_y(argument2, (90 + argument5))
    point_b.x += lengthdir_x(argument3, (-90 + argument5))
    point_b.y += lengthdir_y(argument3, (-90 + argument5))
    point_a.targetX = point_a.x + (lengthdir_x(argument4, argument5))
    point_a.targetY = point_a.y + (lengthdir_y(argument4, argument5))
    point_b.targetX = point_b.x + (lengthdir_x(argument4, argument5))
    point_b.targetY = point_b.y + (lengthdir_y(argument4, argument5))
    while (point_distance(point_a.x, point_a.y, point_a.targetX, point_a.targetY) > 0)
    {
        if position_meeting_collision(point_a.x, point_a.y, argument6)
            break
        else
        {
            point_a.x += lengthdir_x(1, argument5)
            point_a.y += lengthdir_y(1, argument5)
        }
    }
    while (point_distance(point_b.x, point_b.y, point_b.targetX, point_b.targetY) > 0)
    {
        if position_meeting_collision(point_b.x, point_b.y, argument6)
            break
        else
        {
            point_b.x += lengthdir_x(1, argument5)
            point_b.y += lengthdir_y(1, argument5)
        }
    }
    return ((point_direction(point_a.x, point_a.y, point_b.x, point_b.y)) - 180);
}

