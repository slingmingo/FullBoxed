image_speed = 0.5
playerid = obj_player1
if obj_player.inbackground
{
    image_xscale = playerid.xscale * playerid.scale_xs
    image_yscale = playerid.yscale * playerid.scale_ys
}
else
    image_xscale = playerid.xscale
