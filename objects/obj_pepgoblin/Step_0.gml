if (room == rm_editor)
    return;
switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case 128:
        scr_enemy_charge()
        break
    case states.turn:
        scr_enemy_turn()
        break
    case states.walk:
        scr_enemy_walk()
        break
    case states.land:
        scr_enemy_land()
        break
    case states.hit:
        scr_enemy_hit()
        break
    case states.stun:
        scr_enemy_stun()
        break
    case states.Throw:
        scr_pizzagoblin_throw()
        break
    case states.grabbed:
        scr_enemy_grabbed()
        break
    case states.pummel:
        scr_enemy_pummel()
        break
    case states.staggered:
        scr_enemy_staggered()
        break
}

if (paletteselect == -1)
    paletteselect = choose(0, 2)
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != states.stun)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
scr_scareenemy()
if (bombreset > 0)
    bombreset--
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (x != targetplayer.x && state != states.Throw && obj_player.state != states.tumble && bombreset <= 0 && grounded)
{
    if (targetplayer.x > (x - 80) && targetplayer.x < (x + 80) && y <= (targetplayer.y + 100) && y >= (targetplayer.y - 100))
    {
        if (state == states.walk)
        {
            image_index = 0
            sprite_index = spr_pepgoblin_kick
            image_xscale = (-(sign(x - targetplayer.x)))
            state = states.Throw
        }
    }
}
if (grounded && state == states.Throw && floor(image_index) == 3)
    vsp = -5
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
