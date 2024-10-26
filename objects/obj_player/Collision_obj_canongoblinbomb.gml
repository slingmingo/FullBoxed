if (hurted == 0 && other.grounded == 0 && state != states.tauntmoves && state != states.parry)
{
    instance_destroy(other)
    instance_create(x, y, obj_canonexplosion)
}
