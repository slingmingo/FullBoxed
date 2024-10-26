function scr_player_morthook() //gml_Script_scr_player_morthook
{
    jumpstop = 1
    doublejump = 0
    hsp = 0
    vsp = 0
    if (!instance_exists(morthookID))
    {
        state = states.mortjump
        sprite_index = spr_fall
        return;
    }
    image_speed = 0.35
    x = Approach(x, morthookID.x, movespeed)
    y = Approach(y, morthookID.y, movespeed)
    if (floor(x) == morthookID.x && floor(y) == morthookID.y)
    {
        if (sprite_index != spr_player_morthook)
        {
            sprite_index = spr_player_morthook
            image_index = 0
        }
        else if (floor(image_index) == (image_number - 1))
        {
            state = states.mortjump
            sprite_index = spr_mortdoublejumpstart
            scr_soundeffect(sfx_morthook)
            image_index = 0
            vsp = -15
            movespeed = 12
        }
    }
    return;
}

