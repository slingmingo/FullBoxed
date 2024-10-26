with (other)
{
    if (state == states.handstandjump || state == states.lungeattack || state == states.punch)
    {
        image_index = 0
        sprite_index = spr_player_pistolintro
        scr_soundeffect(sfx_shotgungot)
        instance_destroy(other)
        pistolAnim = 1
        state = states.shotgun
        global.heattime = 60
    }
}
