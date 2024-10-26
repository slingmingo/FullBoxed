if (buffer == 0 && other.instakillmove == 1)
{
    vsp = random_range(-10, -18)
    hsp = (sign(x - obj_player.x)) * (random_range(10, 18))
    grav = 0.4
    angle = image_angle
    randomize()
    spinspeed = choose(-4, -8, 4, 8, -2, 2)
    alarm[0] = 5
    cigar = 0
    stomped = 0
    instance_create(x, y, obj_bangeffect)
    buffer = 10
    if (x != obj_player.x)
        image_xscale = (-(sign(x - obj_player.x)))
}
