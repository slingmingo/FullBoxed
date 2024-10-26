repeat (10)
{
    with (create_debris(x, y, spr_cheesedragon_gibs, false))
    {
        hsp = choose(15, -15, 10, 12, -9, -12)
        vsp = choose(-11, 4, -6, 8, -13)
    }
}
instance_create(x, y, obj_explosioneffect)
with (instance_create(x, y, obj_cheeseslime))
{
    endfight = 1
    image_yscale = 1
}
scr_soundeffect(sfx_explosion)
scr_soundeffect(sfx_cheesejump)
