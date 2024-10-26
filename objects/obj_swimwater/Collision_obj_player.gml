if ((obj_player.state == states.mach3 || obj_player.state == states.barrelslide) && obj_player.movespeed > 8 && obj_player.isswimming == false)
{
    if place_meeting(x, (y + 4), obj_player)
        obj_player.vsp = -0.05
    else
        obj_player.vsp = 0
    obj_player.grounded = true
    if (!instance_exists(obj_bumpeffect))
    {
        with (instance_create(obj_player.x, obj_player.y, obj_bumpeffect))
            sprite_index = spr_watereffect
    }
}
else if (place_meeting(x, (y + 1), obj_player) && obj_player.isswimming == false)
{
    if ((!audio_is_playing(sfx_waterslidesplash)) && (!audio_is_playing(sfx_waterslidesplash2)) && (!audio_is_playing(sfx_waterslidesplash3)))
        scr_soundeffect(choose(sfx_waterslidesplash, sfx_waterslidesplash2, sfx_waterslidesplash3))
    if (!instance_exists(obj_bumpeffect))
    {
        with (instance_create(obj_player.x, obj_player.y, obj_bumpeffect))
            sprite_index = spr_watereffect
    }
    alarm[0] = 15
    obj_player.isswimming = true
}
with (obj_player)
{
    if (isswimming == true)
    {
        if (movespeed > 10)
            movespeed -= 0.15
        if (wallspeed > 10)
            wallspeed -= 0.3
        if (vsp > 10 && state != states.freefall)
            vsp = 10
        else if (state == states.freefall && vsp > 16)
            vsp = 16
    }
}
