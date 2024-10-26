ds_list_add(global.saveroom, id)
global.gerome = 1
scr_soundeffect(sfx_geromecollect)
instance_create(x, y, obj_taunteffect)
instance_create(x, y, obj_geromefollow)
instance_destroy()
with (obj_player)
{
    roomstartx = other.x
    roomstarty = other.y
}
