function scr_destroy_destructibles(argument0, argument1) //gml_Script_scr_destroy_destructibles
{
    var _num = instance_place_list((x + argument0), (y + argument1), obj_destructibles, global.instancelist, 0)
    if (_num > 0)
    {
        for (var i = 0; i < ds_list_size(global.instancelist); i++)
            instance_destroy(ds_list_find_value(global.instancelist, i))
        ds_list_clear(global.instancelist)
    }
    return;
}

