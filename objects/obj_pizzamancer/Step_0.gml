if (x < 384)
    image_xscale = -1
else
    image_xscale = 1
if instance_exists(obj_deathfadeout)
    instance_destroy()
if (x <= 40)
    dir = 1
if (x >= 875)
    dir = -1
if (sprite_index == spr_pizzamancer_dead)
{
    x = 734
    if (y < 600)
        y += 1.2
    if (y >= 600)
    {
        sprite_index = spr_pizzamancer_button
        image_index = 0
        y = 480
    }
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_pizzamancer_button)
    instance_destroy()
if (sprite_index != spr_pizzamancer_summoning && sprite_index != spr_pizzamancer_dead && sprite_index != spr_pizzamancer_button)
    x += (5 * dir)
if (floor(image_index) == (image_number - 1))
{
    if (sprite_index == spr_pizzamancer_summoning)
    {
        sprite_index = spr_pizzamancer_idle
        canspawn = 1
    }
}
if (sprite_index == spr_pizzamancer_summoning && floor(image_index) == 4 && (!instance_exists(obj_summoneffect)) && canspawn == 1)
{
    instance_create(x, y, obj_summoneffect)
    canspawn = 0
}
if instance_exists(obj_boss_cheesedragon)
{
    if (obj_boss_cheesedragon.state == "damaged")
        sprite_index = spr_pizzamancer_hurt
    if (obj_boss_cheesedragon.state != "damaged" && sprite_index == spr_pizzamancer_hurt)
        sprite_index = spr_pizzamancer_idle
}
