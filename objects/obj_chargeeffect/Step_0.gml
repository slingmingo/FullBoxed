image_xscale = playerid.xscale * playerid.scale_xs
if (playerid.state != states.rocket && playerid.state != states.mach3 && playerid.state != states.crouchslide && playerid.state != states.shoulderbash)
    instance_destroy()
if (playerid.character == "M")
{
    if (playerid.xscale == -1)
        x = playerid.x - 40
    if (playerid.xscale == 1)
        x = playerid.x + 40
}
else
    x = playerid.x + playerid.xscale * 10
y = playerid.y
if (playerid.state == states.rocket)
    x = playerid.x + playerid.xscale * 18
visible = (!(room == rank_room))
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    visible = false
