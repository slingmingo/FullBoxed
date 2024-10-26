if place_meeting(balloonx, balloony, obj_cursor)
{
    with (instance_create(x, y, obj_balloonpop))
    {
        image_speed = 0.6
        if (other.sprite_index == spr_balloon)
            sprite_index = spr_balloonpop
        if (other.sprite_index == spr_balloon2)
            sprite_index = spr_balloonpop2
        if (other.sprite_index == spr_balloon3)
            sprite_index = spr_balloonpop4
        if (other.sprite_index == spr_balloon4)
            sprite_index = spr_balloonpop3
    }
    instance_create(0, 0, obj_creditsballoon)
}
