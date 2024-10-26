prevpillar_on_camera = pillar_on_camera
room_arr = [[peptutorial_1, space_5, minigolf_11, Loadiingroom], [bossroom_1, medieval_10, minigolf_11, Loadiingroom], [dragon_1, badland_9, minigolf_11, Loadiingroom], [tower_1, Realtitlescreen, minigolf_11, Loadiingroom], [tower_2, Realtitlescreen, minigolf_11, Loadiingroom], [Realtitlescreen, medieval_10, minigolf_11, Loadiingroom], [rm_levelselect, dungeon_5, minigolf_11, Loadiingroom], [entrance_1, entrancetheme, industrial_2, Loadiingroom], [dungeon_1, hub_loadingscreen, wasteyard_6, Loadiingroom], [medieval_1R, ruin_3b, minigolf_11, Loadiingroom], [medieval_2bR, ruin_3b, minigolf_11, dungeon_1], [medieval_3, space_lap, minigolf_11, dungeon_1], [medieval_5, space_lap, minigolf_11, dungeon_1], [medieval_6, farm_9, minigolf_11, dungeon_1], [ruin_1, entrance_1, entrance_6c, Loadiingroom], [ruin_5, entrance_1, entrance_6c, dungeon_1], [ruin_6, entrance_5, entrance_6c, dungeon_1], [badland_1, space_secret4, farm_cube, Loadiingroom], [badland_8, space_secret4, farm_cube, dungeon_1], [badland_9, ruin_treasure, farm_cube, dungeon_1], [badland_mart4, ruin_treasure, farm_cube, dungeon_1], [badland_10, space_secret4, farm_cube, dungeon_1], [forest_1, saloon_2, minigolf_11, Loadiingroom], [forest_G1, saloon_2, minigolf_11, dungeon_1], [forest_G1b, space_8, minigolf_11, Loadiingroom], [forest_5, saloon_2, minigolf_11, dungeon_1], [chateau_1R, wasteyard_6b, minigolf_11, Loadiingroom], [sewer_1, badland_secret3, minigolf_11, Loadiingroom], [freezer_1F, sewer_secret3, minigolf_11, Loadiingroom], [kidsparty_1, editor_entrance, minigolf_11, Loadiingroom], [minigolf_1, ruin_secret1, minigolf_11, Loadiingroom], [industrial_1, saloon_4b, minigolf_11, Loadiingroom], [street_intro, minigolf_1, minigolf_11, Loadiingroom], [farm_1, medieval_6, Disclaimer, Loadiingroom], [space_1, wasteyard_treasure, space_10, Loadiingroom], [wasteyard_1, farm_4b, minigolf_11, Loadiingroom], [saloon_1, saloon_lap, medieval_4, Loadiingroom], [cove_1, farm_12b, minigolf_11, Loadiingroom], [war_1, space_secret1, minigolf_11, Loadiingroom], [strongcold_1, saloon_3b, minigolf_11, Loadiingroom], [characterselect, farm_13, minigolf_11, Loadiingroom], [rm_shhh, farm_11, minigolf_11, Loadiingroom]]
if (instance_exists(obj_hungrypillar) && (!global.timeattack))
{
    var p = false
    with (obj_hungrypillar)
    {
        if bbox_in_camera(view_camera[0], 0)
            p = true
    }
    if (p != pillar_on_camera)
        pillar_on_camera = p
}
else
    pillar_on_camera = false
if (prevpillar_on_camera != pillar_on_camera)
{
    if pillar_on_camera
    {
        audio_sound_gain(pillarmusicID, (0.6 * global.option_music_volume), 2000)
        audio_sound_gain(musicID, 0, 2000)
    }
    else
    {
        audio_sound_gain(pillarmusicID, 0, 2000)
        audio_sound_gain(musicID, (0.6 * global.option_music_volume), 2000)
    }
}
if (global.panic && (!global.timeattack) && global.laps == 0)
{
    if (music != pizzatime && music != mu_finalescape)
    {
        music = pizzatime
        if string_contains(room_get_name(room), "medieval")
            pizzatime = 246
        else if string_contains(room_get_name(room), "ruin")
            pizzatime = 183
        else if string_contains(room_get_name(room), "industrial")
            pizzatime = 77
        else if string_contains(room_get_name(room), "dungeon")
            pizzatime = 5
        else
            pizzatime = 196
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
    }
}
if (global.timeattack == 1 && music != mu_timeattack)
{
    music = mu_timeattack
    audio_stop_sound(musicID)
    musicID = scr_music(music)
}
if (global.laps >= 1 && global.timeattack == 0)
{
    if (global.laps < 2 && music != mu_lap2 && music != mu_lap2N && music != mu_lappingD)
    {
        if (obj_player.character == "P")
            music = mu_lap2
        else if (obj_player.character == "N")
            music = mu_lap2N
        else if (obj_player.character == "D")
            music = mu_lappingD
        audio_stop_sound(musicID)
        musicID = scr_music(music)
    }
    else if (global.laps >= 2 && music != mu_lapping && music != mu_lappingN && music != mu_lappingD)
    {
        if (obj_player.character == "P")
            music = mu_lapping
        else if (obj_player.character == "N")
            music = 184
        audio_stop_sound(musicID)
        musicID = scr_music(music)
    }
}
if (obj_player.character == "N")
    entrancetheme = 155
else
    entrancetheme = 106
