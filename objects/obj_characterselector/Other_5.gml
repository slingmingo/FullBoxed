with (obj_player)
{
    targetDoor = "A"
    camera_zoom(0.05, 0.2)
    scr_characterspr()
}
if instance_exists(obj_coopplayerfollow)
{
    with (obj_coopplayerfollow)
    {
        if (obj_player.character == "P")
            character = "N"
        else
            character = "P"
        scr_characterspr()
    }
}
