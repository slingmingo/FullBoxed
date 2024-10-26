function scr_player_trickjump() //gml_Script_scr_player_trickjump
{
    hsp = movespeed * xscale
    if (sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4)
    {
        if (sprite_index != spr_player_kungfujump && character == "P")
            image_speed = 0.35
        else
            image_speed = 0.5
        if (sprite_index == spr_rampjump && floor(image_index) == (image_number - 1) && character != "N")
            image_index = image_number - 1
    }
    else
    {
        if (sprite_index != spr_player_kungfujump)
            image_speed = 0.5
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_rampjump
    }
    if (wallclimbrollout == 1)
    {
        if (key_down2 && ramp_buffer == 0)
        {
            state = states.tumble
            sprite_index = spr_dive
            vsp = 10
        }
    }
    if (scr_solid((x + xscale), y) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        if (wallclimbrollout == 0)
        {
            state = states.bump
            image_index = 0
            sprite_index = spr_wallsplat
            scr_soundeffect(sfx_bumpwall)
        }
        else
        {
            state = states.climbwall
            image_index = 0
            sprite_index = spr_climbwall
            movespeed = wallspeed
        }
    }
    if (ramp_buffer > 0)
        ramp_buffer--
    if (grounded && ramp_buffer <= 0)
    {
        if (catapulted == 0)
        {
            image_speed = 0.5
            if (sprite_index == spr_rampjump)
            {
                sprite_index = spr_rollgetup
                if (movespeed < 12)
                    state = states.mach2
                else
                    state = states.mach3
            }
            else
            {
                ramp_points = 0
                scr_soundeffect(sfx_groundpound)
                state = states.freefallland
                sprite_index = spr_bodyslamland
                image_index = 0
            }
            global.collect += (ramp_points * 100)
            ramp = 0
        }
        else if (!key_attack)
        {
            ramp_points = 0
            scr_soundeffect(sfx_groundpound)
            state = states.freefallland
            sprite_index = spr_bodyslamland
            image_index = 0
            ramp = 0
        }
        else
        {
            sprite_index = spr_rollgetup
            state = states.mach2
            ramp = 0
        }
    }
    return;
}

