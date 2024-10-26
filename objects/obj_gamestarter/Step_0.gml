if (obj_player.key_jump && canstart == 0 && obj_menupeppino.jumpscaring == 0)
{
    canstart = 1
    windup = 1
    audio_stop_sound(mu_menudarkloop)
    audio_play_sound(mu_title, 1, true, global.option_music_volume, 13.2)
    scr_soundeffect(sfx_switchon)
    obj_menupeppino.alarm[0] = 60
    alarm[2] = 70
}
if (obj_player.key_jump && ispressed == false && canstart == 1 && windup == 0 && obj_menupeppino.selected == 0 && obj_menupeppino.jumpscaring == 0)
{
    alarm[0] = 60
    alarm[1] = 50
    scr_soundeffect(sfx_collectpizza)
    ispressed = true
}
