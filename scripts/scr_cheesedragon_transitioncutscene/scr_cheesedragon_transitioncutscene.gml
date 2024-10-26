function scr_cheesedragon_transitioncutscene() //gml_Script_scr_cheesedragon_transitioncutscene
{
    audio_stop_sound(sfx_vulnerable)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_explode)
    {
        with (obj_camera)
        {
            shake_mag = 4
            shake_mag_acc = 8 / room_speed
        }
        instance_destroy()
    }
}

