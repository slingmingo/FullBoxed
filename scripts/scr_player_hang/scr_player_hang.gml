function scr_player_hang() //gml_Script_scr_player_hang
{
    vsp = 0
    if (sprite_index != spr_playerN_phase3intro2)
    {
        hsp = 0
        wallclingcooldown = 0
        scr_soundeffect(sfx_jump)
        jumpstop = 0
        vsp = bounceheight
        bounceheight += 2.5
        state = states.walljump
        sprite_index = spr_playerN_walljump
        image_index = 0
        with (instance_create(x, y, obj_noisehitfx))
            image_xscale = other.xscale
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_phase3intro2)
    {
        state = states.hypersoar
        hsp = 0
        sprite_index = spr_playerN_phase3intro3
    }
    return;
}

