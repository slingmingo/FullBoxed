if (room == rm_editor)
    return;
var playerid = instance_place(x, (y - 1), obj_player)
with (playerid)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if (state != states.boots && state != states.gameover && state != states.rideweenie && state != states.gotoplayer)
    {
        var _pindex = (object_index == obj_player1 ? 0 : 1)
        GamepadSetVibration(_pindex, 1, 1, 0.85)
        state = states.fireass
        vsp = -20
        sprite_index = spr_fireass
        image_index = 0
        movespeed = hsp
        audio_stop_sound(sfx_fireassstart)
        scr_soundeffect(sfx_fireassstart)
        if ((!audio_is_playing(sfx_pepscream02)) && (!audio_is_playing(sfx_pepscream01)) && (!audio_is_playing(sfx_noisescream)))
        {
            if (obj_player.character == "P")
                scr_soundeffect(choose(sfx_pepscream01, sfx_pepscream02))
            else if (obj_player.character == "N")
                scr_soundeffect(sfx_noisescream)
        }
    }
}
