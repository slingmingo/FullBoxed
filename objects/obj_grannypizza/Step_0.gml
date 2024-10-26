if place_meeting(x, y, obj_player)
    talking = 1
else
    talking = 0
if (talking == 1)
{
    if (sprite_index != spr_tutorialgranny_talk_0)
    {
        sprite_index = spr_tutorialgranny_talk_0
        scr_soundeffect(sfx_enemyprojectile)
    }
}
else
    sprite_index = spr_tutorialgranny_sleep
if global.panic
    text = "GET OUT NOW!!!"
