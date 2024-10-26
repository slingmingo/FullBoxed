if (global.combodropped && global.timeattack && room != timesuproom)
{
    with (obj_player)
    {
        sprite_index = spr_deathstart
        instance_destroy(obj_fadeout)
        targetDoor = "A"
        global.timeattack = 0
        global.panic = 0
        room = timesuproom
        state = states.timesup
        image_index = 0
        audio_stop_all()
        scr_soundeffect(mu_timesup)
    }
}
if (room == rank_room)
    global.timeattack = 0
