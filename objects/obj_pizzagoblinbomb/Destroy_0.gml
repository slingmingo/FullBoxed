if destroy
{
    scr_soundeffect(sfx_bombpep2)
    with (instance_create(x, y, obj_canonexplosion))
        rat = other.grabbable
}
