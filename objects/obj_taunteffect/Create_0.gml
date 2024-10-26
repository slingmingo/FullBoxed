image_speed = 0.5
depth = -3
if obj_player.inbackground
{
    image_xscale = obj_player.xscale * obj_player.scale_xs
    image_yscale = obj_player.yscale * obj_player.scale_ys
}
player = instance_place(x, y, obj_player)
