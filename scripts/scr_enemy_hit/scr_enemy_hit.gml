function scr_enemy_hit() //gml_Script_scr_enemy_hit
{
    x = hitX + (random_range(-6, 6))
    y = hitY + (random_range(-6, 6))
    hitLag--
    sprite_index = stunfallspr
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        var _player = -4
        if (grabbedby == 1)
            _player = 409
        else
            _player = 672
        if (obj_player.tauntstoredstate == states.mach2 || obj_player.tauntstoredstate == states.tumble || obj_player.state == states.mach2 || obj_player.state == states.tumble)
            thrown = 0
        else
            thrown = 1
        vsp = hitvsp
        hsp = hithsp
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        global.combotime = 60
        global.heattime = 60
        alarm[1] = 5
        var _hp = 0
        if ((global.attackstyle == 3 || global.attackstyle == 0) && (!global.kungfu))
            _hp = -1
        if ((((!elite) && (hp <= _hp || mach3destroy)) || (elite && elitehit <= 0 && mach3destroy)) && object_get_parent(object_index) != 16 && destroyable)
        {
            instance_destroy()
            instance_create(x, y, obj_genericpoofeffect)
        }
        stunned = 200
        state = states.stun
    }
    return;
}
