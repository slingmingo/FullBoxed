image_speed = 0.35
depth = -10
switch state
{
    case 217:
        sprite_index = spr_introidle
        image_speed = 0.35
        break
    case 218:
        if (sprite_index != spr_intro)
        {
            sprite_index = spr_intro
            image_index = 0
        }
        if (floor(image_index) == (image_number - 1))
            state = 220
        break
    case 219:
        sprite_index = spr_monstertomato_idle
        x = camera_get_view_x(view_camera[0]) + 480
        y = camera_get_view_y(view_camera[0]) + yy
        switch substate
        {
            case 135:
                yy += 2
                if (yy > 440)
                {
                    var pid = scr_puppet_detect()
                    trace(pid)
                    if (pid != noone)
                    {
                        playerid = pid
                        substate = 141
                    }
                    else
                        substate = states.jump
                }
                break
            case states.jump:
                yy -= 3
                if (yy < -100)
                {
                    destroy = 0
                    with (obj_monstertrackingrooms)
                    {
                        sound_buffer = 0
                        monster_pos[other.monsterid].x = last_puppet_pos.x
                        monster_pos[other.monsterid].y = last_puppet_pos.y
                    }
                    state = 217
                }
                break
            case 141:
                yy -= 10
                if (yy < -100)
                    scr_puppet_appear(playerid)
                break
        }

        break
    case 220:
        playerid = instance_nearest(x, y, obj_player)
        sprite_index = spr_monstertomato_chase
        var dir = point_direction(x, y, playerid.x, playerid.y)
        if (!((x > (playerid.x - 8) && x < (playerid.x + 8) && y > (playerid.y - 8) && y < (playerid.y + 8))))
        {
            x += lengthdir_x(6, dir)
            y += lengthdir_y(6, dir)
        }
        if (x != playerid.x)
            image_xscale = sign(playerid.x - x)
        break
}

if (state != 217)
    inactivebuffer = 900
depth = (state == 219 ? 100 : -6)