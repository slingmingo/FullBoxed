if (room == rm_editor)
    return;
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    with (instance_create(x, y, obj_johnhitstun))
        image_xscale = other.image_xscale
    ds_list_add(global.saveroom, id)
    var _w = sprite_width / 2
    var _h = sprite_height / 2
    camera_zoom(0.9, 0.03)
    with (obj_player)
    {
        if (state != states.chainsaw)
        {
            tauntstoredmovespeed = movespeed
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
            tauntstoredvsp = vsp
        }
        with (instance_create(x, y, obj_parryeffect))
            sprite_index = spr_kungfueffect
        tauntstoredsprite = sprite_index
        image_index = irandom_range(0, (image_number - 1))
        hitLag = 30
        hitX = x
        hitY = y
        state = states.chainsaw
    }
}
