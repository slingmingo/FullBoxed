image_speed = 0.35
image_xscale = 1
switch obj_player.character
{
    case "P":
    case "V":
    case "M":
        sprite_index = spr_pizzaboxunopen
        break
    case "N":
        sprite_index = spr_noisetoppin_cage
        break
}

content = obj_pizzakinshroom
if (obj_player.character == "S")
    instance_destroy()
depth = 0
