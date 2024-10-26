depth = -400
if (instance_number(object_index) > 1)
{
    instance_destroy()
    return;
}
showicon = 0
ini_str = ""
state = states.normal
icon_index = 0
icon_max = sprite_get_number(spr_pizzaslice)
