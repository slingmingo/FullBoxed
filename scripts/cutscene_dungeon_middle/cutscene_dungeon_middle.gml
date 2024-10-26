function cutscene_dungeon_middle() //gml_Script_cutscene_dungeon_middle
{
    with (obj_lavapot)
    {
        destroy = 1
        instance_destroy()
    }
    cutscene_end_action()
    return;
}

