if (visible && ds_list_find_index(global.saveroom, id) == -1)
{
    if (ds_list_find_index(global.saveroom, id) == -1)
    {
        if global.panic
        {
            if (!instance_exists(obj_timeradd))
                instance_create(0, 0, timeradd)
            else
            {
                with (timeradd)
                {
                    seconds += other.seconds
                    seconds += (other.minutes * 60)
                }
            }
        }
        for (var i = 0; i < sprite_get_number(spr_rockdebris); i++)
        {
            with (create_debris(x, y, spr_rockdebris))
                image_index = i
        }
        tile_layer_delete_at(1, x, y)
        tile_layer_delete_at(1, (x + 32), y)
        tile_layer_delete_at(1, (x + 32), (y + 32))
        tile_layer_delete_at(1, x, (y + 32))
        if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
        {
            audio_stop_sound(sfx_breakblock1)
            audio_stop_sound(sfx_breakblock2)
        }
        scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
        ds_list_add(global.saveroom, id)
    }
}
