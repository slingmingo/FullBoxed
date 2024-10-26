playerid = obj_player1
image_speed = 0.5
if obj_player.inbackground
{
    image_xscale = playerid.xscale * playerid.scale_xs
    image_yscale = playerid.yscale * playerid.scale_ys
}
if (obj_player.character == "N")
    sprite_index = spr_chargeeffectN
if (obj_player.character == "V")
    sprite_index = spr_chargeeffectV
if (obj_player.character == "M")
    sprite_index = spr_chargeeffectM
depth = -10
