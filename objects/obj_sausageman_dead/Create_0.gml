vsp = random_range(-10, -18)
hsp = (sign(x - obj_player.x)) * (random_range(10, 18))
obj_camera.camretract = 1
grav = 0.4
randomize()
alarm[0] = 5
cigar = 0
stomped = 0
buffer = 10
if (x != obj_player.x)
    image_xscale = (-(sign(x - obj_player.x)))
depth = -999
paletteselect = 0
spr_palette = palette_cheeseslime
d = 255
angle = image_angle
spinspeed = choose(2, 4, -2, -4, 0, 8, -8)
