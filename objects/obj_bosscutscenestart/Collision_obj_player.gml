with (obj_player)
{
    state = states.layerlaunch
    vsp = -16
    sprite_index = spr_rockethitwall
    loopcutscene = 120
    image_speed = 0.35
    movespeed = 0
    xscale = 1
    global.hasfoughtboss1 = 1
    ini_open("saveData.ini")
    ini_write_real("Bosses", "hasfoughtboss1", global.hasfoughtboss1)
    ini_close()
}
