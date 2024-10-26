x = lerp(x, randomx, 0.05)
y = lerp(y, 320, 0.1)
if instance_exists(obj_flash)
    instance_destroy()
if (floor(image_index) == 75 && canspawn == 1)
{
    canspawn = 0
    instance_create(x, y, choose(obj_cheeseslime, obj_forknight, obj_cheeseslime))
}
