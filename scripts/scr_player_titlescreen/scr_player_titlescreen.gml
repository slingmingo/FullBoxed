function scr_player_titlescreen() //gml_Script_scr_player_titlescreen
{
    if (object_index == obj_player1)
        targetDoor = "A"
    if (sprite_index == spr_pepcooter && (!instance_exists(obj_superdashcloud)))
        instance_create((x - 100), y, obj_superdashcloud)
    image_speed = 0.35
    if (sprite_index == spr_player_hyperpepintro)
    {
        if (image_index < 20)
        {
            with (obj_music)
            {
                var p = audio_sound_get_pitch(musicID)
                if (p > 0)
                    p -= 0.02
                audio_sound_pitch(musicID, p)
            }
        }
        else
        {
            with (obj_music)
            {
                p = audio_sound_get_pitch(musicID)
                if (p < 1)
                    p += 0.05
                if (p > 1)
                    p = 1
                audio_sound_pitch(musicID, p)
            }
        }
    }
    if (floor(image_index) < (image_number - 23) && sprite_index == spr_player_hyperpepintro)
        camera_zoom(0.01, 0.01)
    if (floor(image_index) == (image_number - 24) && sprite_index == spr_player_hyperpepintro && (!audio_is_playing(sfx_pepscreamhyper)))
    {
        instance_create(x, y, obj_cutin)
        scr_soundeffect(sfx_cutin)
        scr_soundeffect(sfx_pepscreamhyper)
        audio_stop_sound(sfx_blackoutpunch)
        obj_drawcontroller.hyperfade = 0
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = 8 / room_speed
        }
        spr_palette = spr_pepfirepalette
        flash = 1
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_phonestart)
        sprite_index = spr_phoneidle
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_hyperpepintro)
        state = states.normal
    if (sprite_index == spr_finishingblow1)
    {
        image_speed = 0
        camera_zoom(0.5, 0.1, true)
    }
    return;
}

