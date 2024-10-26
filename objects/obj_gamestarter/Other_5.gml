if instance_exists(obj_player)
{
    with (obj_player)
        scr_characterspr()
}
obj_player.state = states.comingoutdoor
obj_player.image_index = 0
if (global.swapmode == 1 && (!instance_exists(obj_coopplayerfollow)))
    instance_create(x, y, obj_coopplayerfollow)
if (global.swapmode == 0 && instance_exists(obj_coopplayerfollow))
    instance_destroy(obj_coopplayerfollow)
camera_zoom(0.01, 0.01)
