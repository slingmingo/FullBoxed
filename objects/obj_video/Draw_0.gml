var data = video_draw()
var status = data[0]
if (status == 0)
{
    var surface = data[1]
    var w = surface_get_width(surface)
    var h = surface_get_height(surface)
    var scale = 540 / h
    draw_surface_ext(surface, (480 - w * scale / 2), 0, scale, scale, 0, c_white, 1)
}
