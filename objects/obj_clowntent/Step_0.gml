if (room == rm_editor)
    return;
var playerid = instance_place(x, (y - 1), obj_player)
with (playerid)
{
    if (state != states.boots && state != states.gameover && state != states.rideweenie && state != states.gotoplayer)
    {
        var _pindex = (object_index == obj_player1 ? 0 : 1)
        GamepadSetVibration(_pindex, 1, 1, 0.85)
        state = states.clown
        sprite_index = spr_clown
        if (movespeed < 4)
            movespeed = 8
        hsp = movespeed * xscale
        if (!instance_exists(obj_genericpoofeffect))
            instance_create(x, y, obj_genericpoofeffect)
        if (!audio_is_playing(sfx_taxi1))
            scr_soundeffect(sfx_taxi1)
    }
}
