function scr_player_handstandjump() //gml_Script_scr_player_handstandjump
{
    landAnim = 0
    hsp = xscale * movespeed
    move = key_left + key_right
    momemtum = 1
    dir = xscale
    if (global.attackstyle != 3)
    {
        if (movespeed < 11)
        {
            if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
                movespeed += 0.25
            else if (sprite_index == spr_player_lunge && movespeed < 12)
                movespeed += 0.8
            else if (movespeed < 10 && isswimming == false)
                movespeed += 0.75
            else
                movespeed += 0.25
        }
    }
    else
    {
        if (movespeed < 10)
        {
            if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
                movespeed += 0.25
            else if (movespeed < 10 && isswimming == false)
                movespeed += 0.5
            else
                movespeed += 0.15
        }
        if (global.pummeltest && (!instance_exists(lungeattackID)))
        {
            with (instance_create(x, y, obj_lungehitbox))
            {
                playerid = other.id
                other.lungeattackID = id
            }
        }
    }
    if (shoot == 1)
        var attackdash = spr_player_pistolshot
    else
        attackdash = spr_suplexdash
    if (sprite_index == spr_player_lungestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_lunge
    var airattackdash = spr_suplexdashjump
    var airattackdashstart = spr_suplexdashjumpstart
    if (global.attackstyle == 2)
        vsp = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (key_jump && grounded && (!key_down) && global.attackstyle != 2)
    {
        jumpstop = 0
        image_index = 0
        if (movespeed < 16)
            movespeed += 1
        if (!inbg)
            vsp = -10
        else
            vsp = -5
        state = states.mach2
        sprite_index = spr_longjump
        scr_soundeffect(sfx_longjump)
        scr_soundeffect(sfx_jump)
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_faceplant)
        sprite_index = spr_player_current
    if ((sprite_index == spr_suplexdashjump || sprite_index == spr_suplexdashjumpstart || sprite_index == spr_player_current || sprite_index == spr_player_faceplant) && grounded)
    {
        if key_attack
            state = states.mach2
        else
            state = states.normal
    }
    if (sprite_index == attackdash && (!grounded))
    {
        image_index = 0
        sprite_index = airattackdashstart
    }
    if (grounded && sprite_index == airattackdash && ((!key_attack) || character == "N") && global.attackstyle != 2)
    {
        if (global.attackstyle != 3)
        {
            state = states.normal
            landAnim = 1
            if (move != xscale)
                movespeed = 2
        }
        else
        {
            sprite_index = attackdash
            image_index = image_number - 6
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == attackdash)
        state = states.normal
    if (floor(image_index) == (image_number - 1) && sprite_index == airattackdashstart)
        sprite_index = airattackdash
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_lunge)
    {
        sprite_index = spr_mach4
        state = states.mach3
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_shotgun_suplexdash)
        state = states.normal
    if (floor(image_index) == (image_number - 1) && key_attack && sprite_index == attackdash)
    {
        image_speed = 0.35
        state = states.mach2
        grav = 0.5
    }
    if (sprite_index == spr_player_lunge)
    {
    }
    if (key_down && grounded && global.attackstyle != 2 && isswimming == false)
    {
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        if (movespeed < 12.5)
            movespeed = 12.5
        crouchslipbuffer = 25
        grav = 0.5
        sprite_index = spr_crouchslip
        slidetojumpbuffer = 0
        image_index = 0
        machhitAnim = 0
        state = states.tumble
    }
    if (!inbg)
        mask_index = spr_player_mask
    if (((!grounded) && (place_meeting((x + xscale), y, obj_solid) || scr_solid_slope((x + xscale), y)) && (!(place_meeting((x + xscale), y, obj_destructibles)))) || (grounded && (place_meeting((x + sign(xscale)), (y - 16), obj_solid) || scr_solid_slope((x + sign(xscale)), (y - 16))) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_metalblock))) && scr_slope()))
    {
        if ((movespeed - vsp) > 16)
            wallspeed = 16
        else
            wallspeed = movespeed - vsp
        state = states.climbwall
        climbbuffer = 6
    }
    if (grounded && scr_solid((x + movespeed * xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
    {
        var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
        if _bump
        {
            jumpstop = 1
            state = states.jump
            vsp = -4
            sprite_index = spr_suplexbump
            instance_create((x + xscale * 10), (y + 10), obj_bumpeffect)
        }
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
    image_speed = 0.35
    if (state != states.bump && move != xscale && move != 0)
    {
        image_index = 0
        if (!grounded)
        {
            sprite_index = spr_suplexcancel
            jumpAnim = 1
            grav = 0.5
            state = states.jump
        }
        else
        {
            state = states.normal
            movespeed = 2
            grav = 0.5
        }
    }
    if (key_jump && (!grounded) && (!key_down) && global.attackstyle != 2 && (!ispeppino))
    {
        jumpstop = 0
        image_index = 0
        if (!inbg)
            vsp = -11
        else
            vsp = -5.5
        sprite_index = spr_playerN_noisebombspinjump
        state = states.freefall
    }
    if ((!grounded) && place_meeting((x + xscale), y, obj_solid) && character == "N")
    {
        scr_soundeffect(sfx_wallbounce)
        jumpstop = 0
        vsp = bounceheight
        bounceheight += 2.5
        state = states.walljump
        movespeed = 0
        sprite_index = spr_playerN_walljump
        image_index = 0
        with (instance_create(x, y, obj_noisehitfx))
            image_xscale = other.xscale
    }
    return;
}

