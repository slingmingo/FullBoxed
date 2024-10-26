if (room == rm_editor)
    return;
if (global.collectsound < 10)
    global.collectsound += 1
if place_meeting(x, y, obj_destructibles)
    depth = 102
else
    depth = 2
var _cam_x = camera_get_view_x(view_camera[0])
xto = _cam_x * 0.3
x = xto + xstart - 2000
