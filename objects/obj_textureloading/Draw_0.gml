if (!(ds_exists(tex_list, 2)))
    return;
var p = tex_max - ds_list_size(tex_list)
var t = p / tex_max * 100
var spr_width = sprite_get_width(spr_loadingscreen)
var spr_height = sprite_get_height(spr_loadingscreen)
var xx = floor(480 - spr_width / 2)
var yy = floor(270 - spr_height / 2)
draw_sprite(spr_loadingscreen, 0, xx, yy)
draw_sprite_part(spr_loadingscreen, 1, 0, 0, (spr_width * t / 2), spr_height, xx, yy)
