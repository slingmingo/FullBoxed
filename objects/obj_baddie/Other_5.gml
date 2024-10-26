if instance_exists(obj_fadeout)
{
    if global.enemychangeroom
    {
        if (obj_player.baddiegrabbedID == id)
            persistent = true
        else
            persistent = false
    }
}
