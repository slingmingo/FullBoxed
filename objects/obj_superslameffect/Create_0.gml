image_speed = 0.35
playerid = obj_player1
if (obj_player.character == "N")
    sprite_index = spr_superslameffectN
if (obj_player.character == "V")
    sprite_index = spr_superslameffectV
if (obj_player.character == "M")
    sprite_index = spr_superslameffectM
if obj_player.inbackground
{
    image_xscale = playerid.xscale * playerid.scale_xs
    image_yscale = playerid.yscale * playerid.scale_ys
}
depth = -10
