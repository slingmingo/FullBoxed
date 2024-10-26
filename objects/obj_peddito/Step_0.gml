image_xscale = xscale
if (x > obj_player1.x)
    xscale = -1
else
    xscale = 1
if (blur_effect > 0)
    blur_effect--
else
{
    blur_effect = 2
    create_blur_afterimage(x, y, sprite_index, (image_index - 1), (-xscale))
}
if (obj_player1.xscale == xscale)
{
    x = lerp(x, obj_player1.x, (movespeed / 200))
    y = lerp(y, obj_player1.y, (movespeed / 200))
    if (image_alpha < 1)
        image_alpha += 0.05
    if (movespeed < 16)
        movespeed += 0.05
}
else
{
    movespeed = 2
    if (image_alpha > 0.5)
        image_alpha -= 0.05
}
