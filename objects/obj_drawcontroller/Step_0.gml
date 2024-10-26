flash = Approach(flash, 0, 0.05)
if (obj_player.pizzashield == 1)
    shieldlerp = lerp(shieldlerp, (obj_player.x + (40 + obj_player.movespeed * 2) * obj_player.xscale), 0.35)
if (superattacking == 1)
{
    if (obj_player.character == "P")
        superattackHUD = 2702
    else if (obj_player.character == "N")
        superattackHUD = 3136
    if (fadein < 1)
        fadein += 0.05
    hudpull = lerp(hudpull, 400, 0.1)
    with (obj_camera)
    {
        shake_mag = 3.5
        shake_mag_acc = 15 / room_speed
    }
}
else
{
    hudpull = 0
    fadein = 0
}
