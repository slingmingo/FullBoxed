function scr_player_ghost() //gml_Script_scr_player_ghost
{
    visible = true
    image_speed = 0.35
    if (sprite_index != spr_ghostend)
    {
        move_h = key_right + key_left
        move_v = key_down - key_up
        var maxspeed = 6
        var hspaccel = 0.35
        var vspaccel = 0.35
        if (move_h == 0)
            hspaccel = 0.1
        if (move_v == 0)
            vspaccel = 0.1
        if ((!key_attack) && climbbuffer > 0)
        {
            climbbuffer--
            isboosting = 0
        }
        if (key_attack2 && (move_h != 0 || move_v != 0) && climbbuffer == 0)
        {
            scr_soundeffect(sfx_suplexdash)
            climbbuffer = 50
            isboosting = 1
            if (move_h != 0)
                hsp = 12 * move_h
            if (move_v != 0)
                vsp = 12 * move_v
        }
        if (isboosting && key_attack)
        {
            climbbuffer = 50
            if (move_h != 0)
            {
                if (move_v == 0)
                    sprite_index = spr_ghostdash
                else if (move_v == -1)
                    sprite_index = spr_player_ghostdashupright
                else if (move_v == 1)
                    sprite_index = spr_player_ghostdashdownright
            }
            if (move_h == 0 && move_v == -1)
                sprite_index = spr_player_ghostdashup
            if (move_h == 0 && move_v == 1)
                sprite_index = spr_player_ghostdashdown
            maxspeed = 15
            hspaccel = 0.1
            vspaccel = 0.2
            if ((move_h == 1 && hsp < 4) || (move_h == -1 && hsp > -4))
                isboosting = 0
        }
        hsp = Approach(hsp, (move_h * maxspeed), hspaccel)
        vsp = Approach(vsp, (move_v * maxspeed), vspaccel)
        if place_meeting((x + hsp), y, obj_solid)
        {
            hsp = (-hsp)
            scr_soundeffect(sfx_bumpwall)
            sprite_index = spr_ghostidle
            isboosting = 0
        }
        if place_meeting(x, (y + vsp), obj_solid)
        {
            vsp = (-vsp)
            scr_soundeffect(sfx_bumpwall)
            sprite_index = spr_ghostidle
            isboosting = 0
        }
        if (hsp != 0)
            xscale = sign(hsp)
        if (!key_attack)
        {
            if (move_v < 0)
                sprite_index = spr_ghostjump
            else
                sprite_index = spr_ghostidle
        }
        if (place_meeting(x, y, obj_tombstone) && sprite_index != spr_ghostend)
        {
            sprite_index = spr_ghostend
            image_index = 0
            image_alpha = 1
            vsp = 10
            hsp = 0
            grav = 0.5
            movespeed = 0
            with (instance_place(x, y, obj_tombstone))
            {
                other.x = x
                other.y = y
            }
        }
    }
    if (sprite_index == spr_ghostend && floor(image_index) == (image_number - 1))
        state = states.normal
    if place_meeting(x, y, obj_ghosttransparency)
        image_alpha = 0.5
    else
        image_alpha = 1
    return;
}

function scr_player_ghostpossess() //gml_Script_scr_player_ghostpossess
{
    visible = false
    hsp = 0
    if (!instance_exists(possessID))
    {
        visible = true
        state = states.ghost
        sprite_index = spr_ghostidle
    }
    return;
}

