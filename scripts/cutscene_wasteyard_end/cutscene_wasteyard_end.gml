function cutscene_wasteyard_end() //gml_Script_cutscene_wasteyard_end
{
    with (obj_player)
    {
        state = states.normal
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = 0
    global.graveyardcutscene = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "graveyard", 1)
    cutscene_end_action()
    return;
}

