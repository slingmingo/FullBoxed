if (respawn > 0)
    respawn--
if (respawn == 0 && visible == false)
{
    visible = true
    sprite_index = choose(spr_balloon, spr_balloon2, spr_balloon3, spr_balloon4)
    x = xstart
    y = ystart
}
