with (obj_baddie)
{
    if (place_meeting((x + hsp * 2), y, obj_enemyblock) && thrown == 1)
        instance_destroy(instance_place((x + hsp), y, obj_enemyblock))
    if (place_meeting(x, (y + vsp), obj_enemyblock) && thrown == 1)
        instance_destroy(instance_place(x, (y + vsp), obj_enemyblock))
}
with (obj_sausageman_dead)
{
    if place_meeting((x + hsp * 2), y, obj_enemyblock)
        instance_destroy(instance_place((x + hsp), y, obj_enemyblock))
    if place_meeting(x, (y + vsp), obj_enemyblock)
        instance_destroy(instance_place(x, (y + vsp), obj_enemyblock))
}
with (obj_pizzaball)
{
    if place_meeting((x + hsp), y, obj_enemyblock)
        instance_destroy(instance_place((x + hsp), y, obj_enemyblock))
    if place_meeting(x, (y + vsp), obj_enemyblock)
        instance_destroy(instance_place(x, (y + vsp), obj_enemyblock))
}
with (obj_junk)
{
    if (place_meeting((x + hsp), y, obj_enemyblock) && thrown == 1)
        instance_destroy(instance_place((x + hsp), y, obj_enemyblock))
    if (place_meeting(x, (y + vsp), obj_enemyblock) && thrown == 1)
        instance_destroy(instance_place(x, (y + vsp), obj_enemyblock))
}
with (obj_grabbableblock)
{
    if (place_meeting((x + hsp), y, obj_enemyblock) && thrown == 1)
        instance_destroy(instance_place((x + hsp), y, obj_enemyblock))
    if (place_meeting(x, (y + vsp), obj_enemyblock) && thrown == 1)
        instance_destroy(instance_place(x, (y + vsp), obj_enemyblock))
}
