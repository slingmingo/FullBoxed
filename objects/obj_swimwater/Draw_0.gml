for (var i = 0; i < abs(image_xscale); i++)
    draw_sprite_ext(spr_waterswim, -1, (x + 32 * i), y, 1, 1, 0, c_white, 1)
draw_sprite_ext(spr_waterswim2, -1, x, (y + 32), image_xscale, (image_yscale - 1), 0, c_white, 1)
