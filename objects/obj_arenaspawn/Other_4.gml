if (ds_list_find_index(global.saveroom, id) != -1)
{
    instance_destroy()
    state = states.victory
}
else
{
    with (obj_baddie)
    {
        if arena
        {
            ds_list_add(other.baddielist, [gml_Script_wave, id])
            if (gml_Script_wave > other.maxwave)
                other.maxwave = gml_Script_wave
            maxhp = hp
            instance_deactivate_object(id)
        }
    }
    with (obj_arenadoor)
    {
        if (objectlist != noone && (array_length(objectlist) - 1) > other.maxwave)
            other.maxwave = array_length(objectlist) - 1
    }
}
