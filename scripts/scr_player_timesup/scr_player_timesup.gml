function scr_player_timesup() //gml_Script_scr_player_timesup
{
    xscale = 1
    inv_frames = 0
    if (sprite_index != spr_deathstart)
    {
        image_index = 0
        sprite_index = spr_deathstart
    }
    if (floor(image_index) == 16 && sprite_index == spr_deathstart)
        image_speed = 0
    else if (sprite_index == spr_deathstart)
        image_speed = 0.2
    else
        image_speed = 0.35
    alarm[7] = -1
    alarm[8] = -1
    alarm[5] = -1
    if place_meeting(x, y, obj_timesup)
    {
        state = states.gameover
        sprite_index = spr_deathend
        alarm[10] = 5
        vsp = -8
        hsp = -4
    }
    if (room == timesuproom)
    {
        obj_player1.x = 480
        obj_player1.y = 270
        obj_player2.x = -100
        obj_player2.y = -100
    }
    return;
}

