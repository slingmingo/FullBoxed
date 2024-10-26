image_speed = 0.35
if obj_player.inbackground
{
    image_xscale = playerid.xscale * playerid.scale_xs
    image_yscale = playerid.yscale * playerid.scale_ys
}
else
    image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
if (global.stylethreshold < 2 || playerid.state != states.normal)
    instance_destroy()
