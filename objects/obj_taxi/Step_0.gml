x += hsp
if (hsp != 0)
{
    dust += 1
    if (dust == 40)
    {
        dust = 0
        create_particle(x, (y + 43), 1)
    }
}
with (instance_place(x, y, par_doortriggers))
    other.targetDoor = doorID
