if (room == editor_room)
    return;
if (camretract == 1)
    camretract = 0
player = (obj_player1.spotlight == 1 ? obj_player1 : obj_player2)
if (!instance_exists(obj_pizzaball))
    targetgolf = noone
if (collect_shake > 0)
    collect_shake *= 0.5
if (healthshaketime > 0)
{
    healthshaketime--
    healthshake = random_range(-2, 2)
}
if (healthshaketime == 0)
    healthshake = 0
if (obj_player1.character == "V")
{
    global.playerhealth = 100
    if (healthold != global.playerhealth)
    {
        playerhealthup = healthold < global.hp
        healthshaketime = 30
        healthold = global.playerhealth
    }
}
else if (obj_player1.character == "P")
{
    if (healthold != global.hp)
    {
        playerhealthup = healthold < global.hp
        healthshaketime = 30
        healthold = global.hp
    }
}
if (global.coop == 1)
{
    var p1 = player
    var p2 = (obj_player1.spotlight == 1 ? obj_player2 : obj_player1)
    p2pdistance = point_distance(p1.x, 0, p2.x, 0)
    p2pdistancex = (p1.x >= p2.x ? ((-p2pdistance) / 5) : (p2pdistance / 5))
}
else
    p2pdistancex = 0
if (floor(image_index) == 10)
    shoving = 0
if (room == Disclaimer || string_contains(room_get_name(room), "tutorial") || string_contains(room_get_name(room), "tower") || room == rm_levelselect || room == bossroom_1 || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect || room == hub_loadingscreen || room == tower_1 || room == tower_2 || room == rm_video)
    visible = false
else
    visible = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
    visible = false
if (global.combo >= 10)
    global.SAGEcombo10 = 1
if instance_exists(obj_johnhitstun)
    camera_zoom(0.9, 0.045)
if (global.panic || global.timeattack == 1)
{
    if global.option_cameraeffects
        camera_set_view_angle(view_camera[0], camangle)
    else
    {
        camangle = 0
        camera_set_view_angle(view_camera[0], camangle)
    }
    if layer_exists("Panic01")
        layer_enable_fx(layer_get_id("Panic01"), true)
    if (camangle < 0)
        tiltcon += 0.001
    if (camangle > 0)
        tiltcon -= 0.001
    camangle += tiltcon
    if (layer_exists("Backgrounds_1") && (room == industrial_3 || room == industrial_4 || room == industrial_5 || room == rm_testingpit))
        layer_background_sprite(layer_background_get_id("Backgrounds_1"), bg_factory3escape)
}
else
{
    if layer_exists("Panic01")
        layer_enable_fx("Panic01", false)
    camangle = 0
}
if (shoving == 1 && image_index >= 3 && bang == 0)
{
    with (instance_create(x, y, obj_fallingHUDface))
    {
        if ((obj_player1.spotlight == 0 && obj_player1.character == "P") || (obj_player1.spotlight == 1 && obj_player2.character == "P"))
        {
            sprite = spr_pepinoHUDscream
            hsp = random_range(-1, -5)
        }
        else
        {
            sprite = spr_noiseHUD_panic
            hsp = random_range(1, 5)
        }
    }
    bang = 1
}
if (shoving == 0)
    bang = 0
if (global.seconds <= 0 && global.minutes <= 0 && ded == 0)
{
    alarm[1] = -1
    if (global.miniboss || instance_exists(obj_toppinwarrior))
        alarm[2] = 1
    else
        alarm[3] = 1
    ded = 1
}
if (global.seconds > 59)
{
    global.minutes += 1
    global.seconds -= 59
}
if global.timedgatetimer
{
    if (global.timedgatetime > 0)
        global.timedgatetime--
    else
    {
        global.timedgatetime = 0
        global.timedgatetimer = 0
    }
}
if (!instance_exists(obj_ghostcollectibles))
{
    if ((global.panic == 1 && global.minutes < 1) || player.sprite_index == spr_player_timesup)
    {
        shake_mag = 2
        shake_mag_acc = 3 / room_speed
    }
    else if (global.panic == 1 && basement == 0)
    {
        shake_mag = 2
        shake_mag_acc = 3 / room_speed
    }
}
if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc
    if (shake_mag < 0)
        shake_mag = 0
}
detachedby = -1
detach = 0
follow_golf = 0
if (instance_exists(player) && player.state != states.timesup && player.state != states.gameover && (!follow_golf) && (!detach))
{
    if (room != custom_lvl_room)
    {
        var target = player
        var coopdistance = distance_to_object(obj_player2) / 2
        if (player.state == states.mach2 || player.state == states.mach3)
        {
            var _targetcharge = player.xscale * player.movespeed / 4 * 50
            var _tspeed = 0.3
            chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
        }
        else if ((abs(player.hsp) >= 16 || (player.state == states.chainsaw && player.tauntstoredmovespeed >= 16)) && player.state != states.climbwall && player.state != states.Sjump)
        {
            _targetcharge = player.xscale * abs(player.movespeed) / 4 * 50
            _tspeed = 2
            if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
                _tspeed = 8
            chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
        }
        else if (player.state == states.machslide)
            chargecamera = Approach(chargecamera, 0, 10)
        else
            chargecamera = Approach(chargecamera, 0, 6)
        var cam_width = camera_get_view_width(view_camera[0])
        var cam_height = camera_get_view_height(view_camera[0])
        if (targetgolf != noone && (!instance_exists(targetgolf)))
            targetgolf = noone
        if (targetgolf == noone)
        {
            if ((!global.coop) || room == characterselect || room == rm_levelselect || room == Realtitlescreen)
            {
                var cam_x = camera_get_view_x(view_camera[0])
                var cam_y = camera_get_view_y(view_camera[0])
                if (!global.smoothcamera)
                {
                    cam_x = target.x - cam_width / 2 + chargecamera + p2pdistancex
                    cam_y = target.y - cam_height / 2 - 50
                }
                else
                {
                    cam_x += ((target.x - cam_width / 2 + chargecamera + p2pdistancex - cam_x) * 0.4)
                    cam_y += ((target.y - cam_height / 2 - 50 - cam_y) * 0.25)
                }
                cam_x = clamp(cam_x, 0, (room_width - cam_width))
                cam_y = clamp(cam_y, 0, (room_height - cam_height))
                camera_zoom(1, 0.035)
            }
            else if (obj_player2.state != states.titlescreen)
            {
                cam_x = (obj_player1.x + obj_player2.x) / 2 - cam_width / 2
                cam_y = (obj_player1.y + obj_player2.y) / 2 - cam_height / 2
                var disx = (abs(obj_player1.x - obj_player2.x)) / coop_zoom_width
                var disy = (abs(obj_player1.y - obj_player2.y)) / coop_zoom_height
                var dis = max(disx, disy)
                dis = max(1, dis)
                camera_zoom(dis, 0.035)
            }
        }
        else
        {
            var _px = 0
            var _py = 0
            if global.coop
            {
                _px = obj_player2.x
                _py = obj_player2.y
            }
            cam_x = (obj_player1.x + targetgolf.x + _px) / 2 - cam_width / 2
            cam_y = (obj_player1.y + targetgolf.y + _py) / 2 - cam_height / 2 - 50
            disx = (abs(obj_player1.x - targetgolf.x - _px)) / coop_zoom_width
            disy = (abs(obj_player1.y - targetgolf.y - _py)) / coop_zoom_height
            dis = max(disx, disy)
            dis = max(1, dis)
            camera_zoom(dis, 0.035)
        }
        if (shake_mag != 0)
        {
            cam_x += irandom_range((-shake_mag), shake_mag)
            cam_y += irandom_range((-shake_mag), shake_mag)
        }
        camera_set_view_pos(view_camera[0], cam_x, (cam_y + (irandom_range((-shake_mag), shake_mag))))
    }
    else
    {
        if (overgate == 0)
            target = player
        coopdistance = distance_to_object(obj_player2) / 2
        if (player.state == states.mach3 || player.state == states.rideweenie || player.state == states.machroll)
        {
            if (chargecamera > (player.xscale * 100))
                chargecamera -= 2
            if (chargecamera < (player.xscale * 100))
                chargecamera += 2
        }
        else
        {
            if (chargecamera > 0)
                chargecamera -= 2
            if (chargecamera < 0)
                chargecamera += 2
        }
        cam_width = camera_get_view_width(view_camera[0])
        cam_height = camera_get_view_height(view_camera[0])
        cam_x = target.x - cam_width / 2 + chargecamera + p2pdistancex
        cam_y = target.y - cam_height / 2
        var _room_x = 0
        var _room_y = 0
        var _room_width = room_width
        var _room_height = room_height
        if bound_camera
        {
            _room_x = obj_player.cam.x
            _room_y = obj_player.cam.y
            _room_width = obj_player.cam_width
            _room_height = obj_player.cam_height
            if (obj_player.cam != noone)
            {
                instance_deactivate_object(obj_minijohn_hitbox)
                instance_deactivate_object(obj_pepgoblin_kickhitbox)
                instance_deactivate_object(obj_forkhitbox)
                instance_deactivate_object(obj_baddiecollisionbox)
                instance_deactivate_object(obj_baddie)
                instance_activate_object(obj_inputAssigner)
                offset = 64
                instance_activate_region((_room_x - offset), (_room_y - offset), (_room_width + offset), (_room_height + offset), true)
            }
        }
        if (shake_mag != 0)
        {
            cam_x += irandom_range((-shake_mag), shake_mag)
            cam_y += irandom_range((-shake_mag), shake_mag)
        }
        camera_set_view_pos(view_camera[0], clamp(cam_x, 0, (_room_width - cam_width)), ((clamp(cam_y, 0, (_room_height - cam_height))) + (irandom_range((-shake_mag), shake_mag))))
    }
}
else if follow_golf
{
    if (instance_exists(targetgolf) && targetgolf.thrown == 1)
    {
        var _xx = targetgolf.x
        var _yy = targetgolf.y
        var _freecamera = 0
        _room_x = 0
        _room_y = 0
        var _width = room_width
        var _height = room_height
        if (room == custom_lvl_room)
        {
            if (obj_player1.cam != noone)
            {
                _room_x = obj_player1.cam.x
                _room_y = obj_player1.cam.y
                _width = obj_player1.cam_width
                _height = obj_player1.cam_height
            }
            else
                _freecamera = 1
        }
        _width -= camera_get_view_width(view_camera[0])
        _height -= camera_get_view_height(view_camera[0])
        _xx -= (camera_get_view_width(view_camera[0]) / 2)
        _yy -= (camera_get_view_height(view_camera[0]) / 2)
        if _freecamera
            camera_set_view_pos(view_camera[0], _xx, _yy)
        else
            camera_set_view_pos(view_camera[0], clamp(_xx, _room_x, _width), clamp(_yy, _room_y, _height))
    }
    else
    {
        targetgolf = noone
        follow_golf = 0
    }
}
else if detach
{
    if (overgate == 0)
    {
        camera_zoom(max((room_width / original_cam_width), (room_height / original_cam_height)), 0.035)
        _width = room_width
        _height = room_height
        _width -= camera_get_view_width(view_camera[0])
        _height -= camera_get_view_height(view_camera[0])
        _xx = camera_get_view_x(view_camera[0])
        _yy = camera_get_view_y(view_camera[0])
        _xx = obj_player1.x - camera_get_view_width(view_camera[0]) / 2
        _yy = obj_player1.y - camera_get_view_height(view_camera[0]) / 2
        camera_set_view_pos(view_camera[0], _xx, _yy)
    }
}
if (rank_ix == 1 && (!audio_is_playing(sfx_rankup1)) && rankfresh == 1)
    scr_soundeffect(sfx_rankup1)
if (rank_ix == 2 && (!audio_is_playing(sfx_rankup2)) && rankfresh == 1)
{
    scr_soundeffect(sfx_rankup2)
    audio_stop_sound(sfx_rankup1)
}
if (rank_ix == 3 && (!audio_is_playing(sfx_rankup3)) && rankfresh == 1)
    scr_soundeffect(sfx_rankup3)
if (rank_ix == 4 && (!audio_is_playing(sfx_rankup4)) && rankfresh == 1)
    scr_soundeffect(sfx_rankup4)
if (rank_scale > 2)
    rankfresh = 1
else
    rankfresh = 0
