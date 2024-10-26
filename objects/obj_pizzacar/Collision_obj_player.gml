with (obj_player)
{
    if (state != states.motorcycle)
    {
        sprite_index = spr_player_pizzacar
        image_index = 0
        state = states.motorcycle
        if (!audio_is_playing(sfx_taxi2))
            scr_soundeffect(sfx_taxi2)
    }
}
