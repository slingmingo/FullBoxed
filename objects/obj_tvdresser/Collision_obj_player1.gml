if obj_player1.key_up2
{
    instance_create_depth(obj_player1.x, obj_player1.y, 0, obj_genericpoofeffect)
    audio_play_sound(sfx_enemyprojectile, 1, false)
    if (obj_tv.tvframepaletteselect < 7)
        obj_tv.tvframepaletteselect += 1
    else
        obj_tv.tvframepaletteselect = 1
    ini_open("saveData.ini")
    ini_write_real("Palettes", "tvpal", obj_tv.tvframepaletteselect)
    ini_close()
}
