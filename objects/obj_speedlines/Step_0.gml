x = playerid.x
y = playerid.y
if obj_player.inbackground
{
    image_xscale = playerid.xscale * playerid.scale_xs
    image_yscale = playerid.yscale * playerid.scale_ys
}
else
    image_xscale = playerid.xscale
if (abs(playerid.hsp) <= 0 || playerid.movespeed < 16 || playerid.state == states.comingoutdoor || playerid.state == states.door || room == timesuproom)
    instance_destroy()
if (room == timesuproom)
    instance_destroy()
