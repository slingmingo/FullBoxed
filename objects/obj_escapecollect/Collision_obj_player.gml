if (image_alpha == 1)
{
    if (other.state != states.gotoplayer)
    {
        if ((!audio_is_playing(sfx_bellcollectsmall)) || (!audio_is_playing(sfx_bellcollectsmall2)) || (!audio_is_playing(sfx_bellcollectsmall3)) || (!audio_is_playing(sfx_bellcollectsmall4)))
        {
            audio_stop_sound(sfx_bellcollectsmall)
            audio_stop_sound(sfx_bellcollectsmall2)
            audio_stop_sound(sfx_bellcollectsmall3)
            audio_stop_sound(sfx_bellcollectsmall4)
            scr_soundeffect(choose(sfx_bellcollectsmall, sfx_bellcollectsmall2, sfx_bellcollectsmall3, sfx_bellcollectsmall4))
        }
        if (obj_player1.character == "V")
            global.playerhealth = clamp((global.playerhealth + 1), 0, 100)
        global.heattime += 10
        global.heattime = clamp(global.heattime, 0, 60)
        global.combotime += 10
        global.combotime = clamp(global.combotime, 0, 60)
        if (global.superactive == 1)
            global.style += 0.25
        with (obj_camera)
            healthshaketime = 30
        var val = heat_calculate(15)
        if (other.object_index == obj_player1)
            global.collect += val
        else
            global.collectN += val
        create_collect(x, y, sprite_index)
        with (instance_create((x + 16), y, obj_smallnumber))
            number = string(val)
        instance_destroy()
    }
}
