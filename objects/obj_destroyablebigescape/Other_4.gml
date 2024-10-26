if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()
if (global.snickchallenge == 1)
    instance_destroy()
if (global.timeattack == 1)
    instance_destroy()
if (global.panic == 0)
{
    visible = false
    instance_deactivate_object(self)
}
else
    visible = true
