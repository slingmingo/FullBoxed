if (other.state != states.gotoplayer)
{
    if (obj_player1.character == "V")
        global.playerhealth = clamp((global.playerhealth + 10), 0, 100)
    if (global.superactive == 1)
        global.style += 2
    global.heattime = 60
    with (obj_camera)
        healthshaketime = 60
    instance_destroy()
    global.combotime = 60
    var val = heat_calculate(150)
    if (other.object_index == obj_player1)
        global.collect += val
    else
        global.collectN += val
    create_collect(x, y, sprite_index)
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    if (obj_player1.character == "P")
    {
        tv_do_expression(spr_tv_exprcollect)
        scr_soundeffect(sfx_collectpizza)
    }
    if (obj_player1.character == "N")
    {
        tv_do_expression(spr_tv_exprcollectN)
        scr_soundeffect(choose(sfx_Ncollect1, sfx_Ncollect2, sfx_Ncollect3))
    }
}
