function scr_savescore(argument0) //gml_Script_scr_savescore
{
    if ((global.collect + global.collectN) >= global.srank)
    {
        global.rank = "s"
        if (global.srank && global.treasure == 1 && global.secretfound >= 3 && (!global.combodropped))
            global.rank = "p"
        if (global.snickchallenge == 1)
            global.SAGEsnicksrank = 1
    }
    else if ((global.collect + global.collectN) > global.arank)
        global.rank = "a"
    else if ((global.collect + global.collectN) > global.brank)
        global.rank = "b"
    else if ((global.collect + global.collectN) > global.crank)
        global.rank = "c"
    else
        global.rank = "d"
    if instance_exists(obj_bosscontroller)
    {
        if (obj_bosscontroller.playerhp == 6 && obj_bosscontroller.playerhurt == 0)
            scr_soundeffect(mu_rankp)
        else if (obj_bosscontroller.playerhp == 5 || (obj_bosscontroller.playerhp == 6 && obj_bosscontroller.playerhurt == 1))
        {
            if (!audio_is_playing(mu_ranks))
                scr_soundeffect(mu_ranks)
        }
        if (obj_bosscontroller.playerhp == 4)
        {
            if (!audio_is_playing(mu_ranka))
                scr_soundeffect(mu_ranka)
        }
        if (obj_bosscontroller.playerhp == 3)
        {
            if (!audio_is_playing(mu_rankb))
                scr_soundeffect(mu_rankb)
        }
        if (obj_bosscontroller.playerhp == 2)
        {
            if (!audio_is_playing(mu_rankc))
                scr_soundeffect(mu_rankc)
        }
        if (obj_bosscontroller.playerhp == 1)
        {
            if (!audio_is_playing(mu_rankd))
                scr_soundeffect(mu_rankd)
        }
    }
    else
    {
        if (global.rank == "p")
            scr_soundeffect(mu_rankp)
        if (global.rank == "s")
            scr_soundeffect(mu_ranks)
        if (global.rank == "a")
            scr_soundeffect(mu_ranka)
        if (global.rank == "b")
            scr_soundeffect(mu_rankb)
        if (global.rank == "c")
            scr_soundeffect(mu_rankc)
        if (global.rank == "d" || global.rank == "norank")
            scr_soundeffect(mu_rankd)
    }
    audio_stop_sound(mu_pizzatime)
    audio_stop_sound(mu_noiseescape)
    audio_stop_sound(mu_lapping)
    audio_stop_sound(mu_lappingN)
    audio_stop_sound(mu_dragonlair)
    audio_stop_sound(mu_snickchallenge)
    audio_stop_sound(sfx_30secondswarning)
    audio_stop_sound(mu_snickchallengeend)
    ini_open("LevelData")
    if (ini_read_real("Highscore", argument0, 0) < global.collect)
    {
        ini_write_real("Highscore", argument0, global.collect)
        ini_write_string("Ranks", argument0, global.rank)
    }
    if (ini_read_real("Treasure", argument0, 0) == 0)
        ini_write_real("Treasure", argument0, global.treasure)
    if (global.secretfound > 3)
        global.secretfound = 3
    if (ini_read_real("Secret", argument0, 0) < global.secretfound)
        ini_write_string("Secret", argument0, global.secretfound)
    if (ini_read_real("Toppin", (argument0 + "1"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "1"), global.shroomfollow)
    if (ini_read_real("Toppin", (argument0 + "2"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "2"), global.cheesefollow)
    if (ini_read_real("Toppin", (argument0 + "3"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "3"), global.tomatofollow)
    if (ini_read_real("Toppin", (argument0 + "4"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "4"), global.sausagefollow)
    if (ini_read_real("Toppin", (argument0 + "5"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "5"), global.pineapplefollow)
    ini_close()
    return;
}

