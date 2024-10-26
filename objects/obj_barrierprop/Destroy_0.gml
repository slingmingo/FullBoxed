if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_barrier
    ds_list_add(global.saveroom, id)
}
