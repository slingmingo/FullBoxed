x = obj_player1.x
y = obj_player1.y
with (obj_camera)
{
    shake_mag = 0
    shake_mag_acc = 0
}
if (targetgolf == -4 && global.smoothcamera)
{
    if ((!global.coop) || room == characterselect || room == rm_levelselect || room == Realtitlescreen)
    {
        if (secretcam == 1)
        {
            player = obj_secretportalstart
            secretcam = 0
        }
        else if (secretcamexit == 1)
        {
            player = obj_player1.secretportalID
            secretcamexit = 0
        }
        else
            player = (obj_player1.spotlight == 1 ? obj_player1 : obj_player2)
        var target = player
        if (!instance_exists(target))
            target = obj_player1
        var cam_width = camera_get_view_width(view_camera[0])
        var cam_height = camera_get_view_height(view_camera[0])
        var cam_x = camera_get_view_x(view_camera[0])
        var cam_y = camera_get_view_y(view_camera[0])
        cam_x = target.x - cam_width / 2 + chargecamera + p2pdistancex
        cam_y = target.y - cam_height / 2 - 50
        cam_x = clamp(cam_x, 0, (room_width - cam_width))
        cam_y = clamp(cam_y, 0, (room_height - cam_height))
        camera_zoom(1, 0.035)
        camera_set_view_pos(view_camera[0], cam_x, (cam_y + (irandom_range((-shake_mag), shake_mag))))
    }
}
if ((global.panic == 1 || global.snickchallenge == 1) && global.panicbg)
    warbg_init()
application_surface_draw_enable(true)
global.wave = global.maxwave - (global.minutes * 60 + global.seconds) * 60
