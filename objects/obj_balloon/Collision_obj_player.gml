if (other.state == states.gotoplayer)
    return;
scr_soundeffect(sfx_hitenemy)
with (instance_create(x, y, obj_balloonpop))
{
    image_speed = 0.6
    if (other.sprite_index == spr_balloon)
        sprite_index = spr_balloonpop
    if (other.sprite_index == spr_balloon2)
        sprite_index = spr_balloonpop2
    if (other.sprite_index == spr_balloon3)
        sprite_index = spr_balloonpop3
    if (other.sprite_index == spr_balloon4)
        sprite_index = spr_balloonpop4
}
other.vsp = -15
other.jumpstop = 1
visible = false
x = -100
y = -100
respawn = 100
if (other.state == states.jump)
    other.sprite_index = other.spr_machfreefall
if (other.state == states.climbwall)
{
    other.sprite_index = other.spr_machfreefall
    other.state = states.jump
}
