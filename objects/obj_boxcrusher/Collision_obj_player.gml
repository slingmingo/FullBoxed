if (other.state == states.gotoplayer)
    return;
if (sprite_index == spr_boxcrusher_fall)
{
    other.image_index = 0
    other.state = states.bump
    other.x = x
    other.y = y
}
else if (sprite_index == spr_boxcrusher_land)
{
    other.boxxed = 1
    if (!audio_is_playing(sfx_transform))
    {
        scr_soundeffect(sfx_transform)
        scr_soundeffect(sfx_groundpound)
    }
    other.movespeed = 0
    other.state = states.boxxedpep
    if (other.sprite_index != other.spr_boxxedpepintro)
        other.sprite_index = other.spr_boxxedpepintro
    other.image_index = 0
    other.hsp = 0
    other.vsp = 0
    other.x = x
    other.y = y - 20
}
