xoffset = Wave(-40, 40, 2, 10)
yoffset = Wave(-30, 48, 4, 10)
x = obj_player1.x + xoffset
y = obj_player1.y + yoffset
if (!global.key_inv)
    instance_destroy()
