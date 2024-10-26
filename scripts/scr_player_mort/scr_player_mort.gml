function scr_player_mort() //gml_Script_scr_player_mort
{
    move = key_right + key_left
    hsp = movespeed * xscale
    mort = 0
    doublejump = 0
    jumpstop = 0
    if key_jump
        input_buffer_jump = 0
    if (move != 0)
    {
        if (move == xscale)
            movespeed = Approach(movespeed, 8, 0.8)
        else
            movespeed = Approach(movespeed, 0, 0.8)
        if (movespeed <= 0)
            xscale = move
    }
    else
        movespeed = Approach(movespeed, 0, 0.8)
    if (move != 0)
        image_speed = movespeed / 12
    else
        image_speed = 0.4
    if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        movespeed = 0
        if (sprite_index == spr_player_barrelmove)
            sprite_index = spr_player_barrelidle
    }
    if (!landAnim)
    {
        if (move != 0)
            sprite_index = spr_player_mortwalk
        else if (!key_attack)
        {
            sprite_index = spr_player_mortidle
            image_speed = 0.35
        }
    }
    else if (floor(image_index) == (image_number - 1))
    {
        landAnim = 0
        if (move != 0)
            sprite_index = spr_player_mortwalk
        else
            sprite_index = spr_player_mortidle
    }
    if (!grounded)
    {
        state = states.mortjump
        sprite_index = spr_player_mortjump
    }
    else if (input_buffer_jump < 8)
    {
        input_buffer_jump = 0
        state = states.mortjump
        doublejump = 0
        vsp = -11
        sprite_index = spr_player_mortjumpstart
        image_index = 0
        scr_soundeffect(sfx_jump)
        instance_create(x, y, obj_highjumpcloud1)
    }
    mort_attack()
    return;
}

function mort_attack() //gml_Script_mort_attack
{
    if (move != 0)
        xscale = move
    if key_slap2
    {
        if (!key_up)
        {
            state = states.mortattack
            sprite_index = spr_player_mortattackfront
            scr_soundeffect(sfx_mortside)
            image_index = 0
            movespeed = 8
        }
        var _angle = 0
        if key_up
        {
            state = states.mortattack
            _angle = 90
            sprite_index = spr_player_mortattackup
            scr_soundeffect(sfx_mortup)
            if grounded
                vsp = -6
            image_index = 0
        }
        else if (key_down && (!grounded))
        {
            vsp = 3
            _angle = 270
            sprite_index = spr_player_mortattackdown
            image_index = 0
            scr_soundeffect(sfx_mortdown)
        }
        with (instance_create(x, y, obj_morthitbox))
        {
            playerid = other.id
            if (_angle == 0)
                image_xscale = other.xscale
            image_angle = _angle
            alarm[0] = 15
        }
    }
    if (sprite_index == spr_player_mortattackdown || sprite_index == spr_player_mortattackup || sprite_index == spr_player_mortattack)
    {
        if (punch_afterimage > 0)
            punch_afterimage--
        else
        {
            punch_afterimage = 5
            create_blue_afterimage(x, y, sprite_index, image_index, xscale)
        }
    }
    return;
}

function Mort_DownMovement() //gml_Script_Mort_DownMovement
{
    if (image_angle == 270)
    {
        with (playerid)
        {
            doublejump = 0
            vsp = -10
        }
    }
    return;
}

