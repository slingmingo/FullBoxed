with (obj_player)
{
    if (character == "P")
    {
        character = "N"
        pizzapepper = 0
        pistolAnim = 0
        ispeppino = 0
        scr_characterspr()
        image_index = 1
    }
    else if (character == "N")
    {
        character = "V"
        ispeppino = 1
        pizzapepper = 0
        scr_characterspr()
        image_index = 1
    }
    else if (character == "V")
    {
        character = "M"
        ispeppino = 1
        pizzapepper = 0
        scr_characterspr()
        image_index = 1
    }
    else if (character == "M")
    {
        character = "P"
        ispeppino = 1
        pizzapepper = 0
        scr_characterspr()
        image_index = 1
    }
}
instance_destroy()
