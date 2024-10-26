hsp = random_range(-5, 5)
vsp = random_range(-2, -10)
grav = 0.5
image_index = random_range(0, 5)
image_speed = 0
image_angle = random_range(0, 360)
depth = -1
if obj_player.inbackground
{
    image_xscale = obj_player.xscale * obj_player.scale_xs
    image_yscale = obj_player.yscale * obj_player.scale_ys
}
