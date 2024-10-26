if (room == rm_editor)
    return;
steppy = 20
if instance_exists(obj_flash)
    instance_destroy()
switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case states.turn:
        scr_enemy_turn()
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
    case states.rage:
        scr_enemy_rage()
        break
    case states.ghostpossess:
        scr_enemy_ghostpossess()
        break
}

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
var player = instance_nearest(x, y, obj_player)
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
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
