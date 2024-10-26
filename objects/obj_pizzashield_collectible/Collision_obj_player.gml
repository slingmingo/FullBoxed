if (other.state != states.gotoplayer)
{
    if audio_is_playing(sfx_collecttopping)
        audio_stop_sound(sfx_collecttopping)
    scr_soundeffect(sfx_collecttopping)
    instance_create(x, y, obj_genericpoofeffect)
    scr_soundeffect(sfx_transform)
    with (other)
        pizzashield = 1
    instance_destroy()
}
