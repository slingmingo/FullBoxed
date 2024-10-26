if place_meeting(x, y, obj_player)
    talking = 1
else
    talking = 0
if (talking == 1)
{
    camera_zoom(0.75, 0.05)
    if (sprite_index != spr_anton_idle)
    {
        sprite_index = spr_anton_idle
        scr_soundeffect(sfx_enemyprojectile)
    }
}
else
    sprite_index = spr_anton_idle
