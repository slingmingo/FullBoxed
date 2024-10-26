playerid = obj_player1
image_speed = 0.5
if obj_player.inbackground
{
    image_xscale = playerid.xscale * playerid.scale_xs
    image_yscale = playerid.yscale * playerid.scale_ys
}
else
    image_xscale = playerid.xscale
depth = -10
