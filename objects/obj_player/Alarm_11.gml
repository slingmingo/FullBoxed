if (state == states.clown)
{
    idle = 0
    state = states.normal
    instance_create(x, y, obj_genericpoofeffect)
}
if (sprite_index == spr_playerN_jetpackboostdown)
{
    repeat irandom_range(1, 3)
        create_heatpuff((x + (irandom_range(-24, 24))), (y + 40))
    alarm[11] = 10
}
