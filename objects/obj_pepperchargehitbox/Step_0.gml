x = obj_player.x + 32 * obj_player.xscale
y = obj_player.y - 16
image_xscale = obj_player.xscale
if (obj_player.state != states.shoulderbash)
    instance_destroy()
if (global.showhitboxes == true)
    visible = true
else
    visible = false
