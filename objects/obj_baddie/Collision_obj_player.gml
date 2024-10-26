if (obj_player.pizzapepper == 1 || state == states.iceblock)
{
    if (!instance_exists(obj_bosscontroller))
        global.combo += 1
    global.combotime = 60
    instance_destroy()
}
