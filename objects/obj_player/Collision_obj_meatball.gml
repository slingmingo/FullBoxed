if (grounded && sprite_index != spr_squished && other.rolling == 1)
{
    sprite_index = spr_squished
    image_index = 0
    image_speed = 0.5
    scr_soundeffect(sfx_groundpound)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = 15 / room_speed
    }
    state = states.Sjumpland
    hsp = 0
}
