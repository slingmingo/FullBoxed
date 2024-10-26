image_speed = 0
spr = spr_cutin
got = 0
effectid = -4
player = obj_treasureeffect
depth = -6
switch global.leveltosave
{
    case "entrance":
        image_index = 0
        break
    case "medieval":
        image_index = 1
        break
    case "ruin":
        image_index = 2
        break
    case "dungeon":
        image_index = 3
        break
}

