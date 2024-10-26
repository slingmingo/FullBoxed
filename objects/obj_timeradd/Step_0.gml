minutes = 0
if instance_exists(obj_chunktimer)
{
    with (obj_chunktimer)
        global.fill += 0.045
    seconds--
}
if (seconds <= 0)
    instance_destroy()
if (!audio_is_playing(sfx_knightslide))
{
    knightslide = audio_play_sound(sfx_knightslide, 1, false)
    sfx_gain(knightslide)
}
