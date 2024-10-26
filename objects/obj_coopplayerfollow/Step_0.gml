state = obj_player.state
movespeed = obj_player.movespeed
grounded = (place_meeting(x, (y + 1), obj_solid) || place_meeting(x, (y + 1), obj_platform))
if (room == rank_room)
    visible = false
else
    visible = true
if (state == states.normal && movespeed == 0 && grounded)
{
    jetpackflight = 0
    image_speed = 0.35
    sprite_index = spr_idle
}
else if (state == states.normal && grounded)
{
    jetpackflight = 0
    sprite_index = spr_move
    image_speed = movespeed / 20 + 0.1
}
if (state == states.jump && (!jetpackflight))
{
    image_speed = 0.35
    if (!grounded)
    {
        if (obj_player.sprite_index == spr_player_jump || obj_player.sprite_index == spr_playerN_jump)
        {
            if (sprite_index != spr_jump)
                image_index = 0
            sprite_index = spr_jump
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_jump)
        sprite_index = spr_fall
    if (sprite_index != spr_jump && sprite_index != spr_fall && (!grounded))
        sprite_index = spr_airdash2
}
if (state == states.punch && (obj_player.sprite_index == spr_player_breakdanceuppercut || obj_player.sprite_index == spr_playerN_breakdanceuppercut))
{
    if (!grounded)
    {
        if (sprite_index != spr_uppercut)
            image_index = 0
        sprite_index = spr_uppercut
    }
    if (floor(image_index) >= (image_number - 2))
        image_speed = 0
    else
        image_speed = 0.4
}
if (state == states.tumble)
{
    if ((obj_player.sprite_index == spr_player_crouchslip || obj_player.sprite_index == spr_playerN_crouchslip) && grounded)
        sprite_index = spr_crouchslip
    else if (obj_player.sprite_index == spr_player_jumpdive1 || obj_player.sprite_index == spr_player_jumpdive2)
        sprite_index = spr_mach2jump
    if (obj_player.sprite_index == spr_player_dive)
        sprite_index = spr_dive
    if ((obj_player.sprite_index == spr_player_backslide || obj_player.sprite_index == spr_player_crouchslide || obj_player.sprite_index == spr_playerN_machroll) && grounded)
        sprite_index = spr_machroll
}
if (state == states.mach2)
{
    image_speed = 0.5
    if grounded
        sprite_index = spr_mach
    else
        sprite_index = spr_mach2jump
}
if (state == states.mach3)
{
    if (obj_player.sprite_index == spr_player_rollgetup || obj_player.sprite_index == spr_playerN_rollgetup)
        sprite_index = spr_rollgetup
    if (sprite_index == spr_rollgetup)
        image_speed = 0.3
    else
        image_speed = 0.5
    if (grounded && movespeed < 18 && sprite_index != spr_rollgetup)
        sprite_index = spr_mach4
    else if (movespeed < 18 && sprite_index != spr_rollgetup)
        sprite_index = spr_mach2jump
    if (floor(image_index) >= (image_number - 2))
    {
        if (sprite_index == spr_rollgetup)
            sprite_index = spr_mach4
    }
    if (movespeed > 18)
        sprite_index = spr_crazyrun
}
if (state == states.climbwall || state == states.Sjump)
{
    sprite_index = spr_superjump
    image_speed = 0.4
}
if (state == states.spin)
{
    sprite_index = spr_player_breakdancesuper
    image_speed = 0.5
}
if (state == states.hypersoar)
{
    sprite_index = spr_player_supersidejump
    image_speed = 0.5
}
if (state == states.fireass)
{
    if (!grounded)
        sprite_index = spr_fireass
    else
        sprite_index = spr_fireassground
}
if (state == states.knightpepslopes || state == states.knightpep || state == states.knightpepbump)
{
    if (movespeed > 0)
        image_speed = movespeed / 20 + 0.1
    else
        image_speed = 0.35
    if grounded
    {
        if (movespeed > 0)
            sprite_index = spr_move
        else
            sprite_index = spr_idle
    }
    else
        sprite_index = spr_fall
}
if (obj_player.sprite_index == spr_player_groundpoundcancel1)
    sprite_index = spr_bodyslamfall
if (obj_player.sprite_index == spr_player_groundpoundcancel2)
    sprite_index = spr_bodyslamland
if (floor(image_index) >= (image_number - 1) && sprite_index == spr_bodyslamland)
    sprite_index = spr_idle
if (floor(image_index) >= (image_number - 3) && sprite_index == spr_bodyslamstart)
    sprite_index = spr_bodyslamfall
if (floor(image_index) >= (image_number - 2) && sprite_index == spr_playerN_doublejump)
    sprite_index = spr_playerN_doublejumpfall
if (obj_player.state != states.coopflight && obj_player.key_jump && obj_player.key_up && obj_player.pizzapepper == 0)
{
    jetpackflight = 1
    sprite_index = spr_playerN_doublejump
    obj_player.state = states.coopflight
    obj_player.vmovespeed = -1
    obj_player.movespeed *= obj_player.xscale
    image_speed = 0.35
}
