var playerid = obj_player1
if (obj_player1.spotlight == 0)
    playerid = obj_player2
if (sprite_index == spr_pizzaface_enterroom && floor(image_index) == (image_number - 1))
    sprite_index = spr_pizzaface
if (afterimage != 0)
    afterimage--
else
{
    afterimage = 4
    create_attack_afterimage(x, y, sprite_index, image_index, image_xscale)
}
if (obj_player1.movespeed > 0)
    mockmovespeed = obj_player1.movespeed
else
    mockmovespeed = (-obj_player1.movespeed)
if (image_alpha == 1)
{
    var dir = point_direction(x, y, playerid.x, playerid.y)
    x += lengthdir_x(maxspeed, dir)
    y += lengthdir_y(maxspeed, dir)
}
else if (arriving == true)
    image_alpha += 0.01
maxspeed = clamp((6 + mockmovespeed / 5 + distance_to_object(obj_player) / 200), 6, 30)
if (place_meeting(x, y, playerid) && (!playerid.cutscene) && playerid.state != states.actor && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && image_alpha == 1)
{
    if instance_exists(obj_toppinwarrior)
    {
        if (variable_global_exists("toppinwarriorid1") && instance_exists(global.toppinwarriorid1))
            instance_destroy(global.toppinwarriorid1)
        else if (variable_global_exists("toppinwarriorid2") && instance_exists(global.toppinwarriorid2))
            instance_destroy(global.toppinwarriorid2)
        else if (variable_global_exists("toppinwarriorid3") && instance_exists(global.toppinwarriorid3))
            instance_destroy(global.toppinwarriorid3)
        else if (variable_global_exists("toppinwarriorid4") && instance_exists(global.toppinwarriorid4))
            instance_destroy(global.toppinwarriorid4)
        else if (variable_global_exists("toppinwarriorid5") && instance_exists(global.toppinwarriorid5))
            instance_destroy(global.toppinwarriorid5)
        instance_create(x, y, obj_flash)
        global.seconds = 59
        obj_camera.alarm[1] = 60
        instance_destroy()
        camera_zoom(0.05, 0.2)
    }
    else if (!instance_exists(obj_toppinwarrior))
    {
        with (playerid)
        {
            sprite_index = spr_deathstart
            instance_destroy(obj_fadeout)
            targetDoor = "A"
            room = timesuproom
            state = states.timesup
            image_index = 0
            audio_stop_all()
            scr_soundeffect(mu_timesup)
        }
    }
    instance_destroy()
}
if (maxspeed < 3 && image_alpha == 1)
    maxspeed += 0.01
