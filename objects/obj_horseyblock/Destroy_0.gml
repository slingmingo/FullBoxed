if (ds_list_find_index(global.saveroom, id) == -1)
{
    create_particle(x, y, 9)
    ds_list_add(global.saveroom, id)
}
