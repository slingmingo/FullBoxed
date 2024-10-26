function scr_player_gottreasure() //gml_Script_scr_player_gottreasure
{
    if (sprite_index != spr_player_poweredup)
    {
        sprite_index = spr_gottreasure
        image_speed = 0.2
    }
    else
        image_speed = 0.4
    mach2 = 0
    return;
}

