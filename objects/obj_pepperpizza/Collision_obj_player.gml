if (obj_player.state != states.gottreasure && obj_player.character == "P")
{
    scr_soundeffect(sfx_secretfound)
    x = obj_player.x
    y = obj_player.y - 46
    alarm[0] = 60
    with (obj_player)
    {
        pizzapepper = 1
        state = states.gottreasure
        hsp = 0
        vsp = 0
    }
}
