if ((!pause) && obj_player1.key_start)
{
    var _cutscenehandler = 0
    with (obj_cutscene_handler)
    {
        if (!loop)
            _cutscenehandler = 1
    }
    with (obj_secretportal)
    {
        if touched
            _cutscenehandler = 1
    }
    with (obj_secretportalstart)
        _cutscenehandler = 1
    if (obj_savesystem.state == states.normal && (!_cutscenehandler) && room != rank_room && room != Titlescreen && room != timesuproom && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_technicaldifficulty)))
    {
        peppinox = obj_camera.x
        peppinoy = obj_camera.y
        peppinosprite = obj_player.sprite_index
        selected = 0
        pause = 1
        pushadd = 0
        audio_pause_all()
    }
}
cursory = selected * 32 + 75
if pause
    borderzoom = lerp(borderzoom, 1, 0.1)
else
    borderzoom = 2
if (pausealpha != 0.5 && pause == 1)
    pausealpha += 0.025
else if (pause == 0 && pausealpha > 0)
    pausealpha -= 0.05
if ((!audio_is_playing(mu_pause)) && pause == 1)
    scr_music(mu_pause)
else if (pause == 0)
    audio_stop_sound(mu_pause)
with (obj_player1)
{
    other.paletteselect = paletteselect
    other.spr_palette = spr_palette
}
if (pause && (!instance_exists(obj_option)))
{
    scr_getinput()
    application_surface_draw_enable(true)
    var prevselected = selected
    moveselect = (-key_up2) + key_down2
    selected += moveselect
    if (moveselect != 0 && selected >= 0 && selected <= 3)
        scr_soundeffect(sfx_step)
    selected = clamp(selected, 0, (array_length(pause_menu) - 1))
    if (prevselected != selected)
    {
        switch selected
        {
            case 0:
                peppino_sprite = spr_player_idle
                pushadd = 0
                break
            case 1:
                peppino_sprite = spr_file1
                pushadd = 0
                break
            case 2:
                peppino_sprite = spr_player_panic
                pushadd = 85
                break
            case 3:
                peppino_sprite = spr_player_winding
                pushadd = 45
                break
        }

        peppino_sprite_number = sprite_get_number(peppino_sprite)
        peppino_index = 0
    }
    if key_jump
    {
        switch selected
        {
            case 0:
                pause = 0
                instance_activate_all()
                scr_deactivate_escape()
                alarm[1] = 1
                audio_resume_all()
                with (obj_music)
                {
                    if secret
                        audio_pause_sound(musicID)
                }
                break
            case 2:
                var roomname = room_get_name(room)
                if ((!global.snickchallenge) && room != tower_1 && room != tower_2)
                {
                    var rm = -4
                    rm = global.leveltorestart
                    global.secretfound = 0
                    with (obj_camera)
                        rank_ix = 0
                    ds_list_clear(global.saveroom)
                    ds_list_clear(global.baddieroom)
                    if (rm != -4 && rm != -1)
                    {
                        instance_activate_all()
                        global.levelreset = 0
                        scr_playerreset()
                        global.levelreset = 1
                        obj_player1.targetDoor = "A"
                        if instance_exists(obj_player2)
                            obj_player2.targetDoor = "A"
                        if (!(string_contains(room_get_name(room), "bossroom")))
                        {
                            scr_room_goto(rm)
                            if instance_exists(obj_bosscontroller)
                                instance_destroy(obj_bosscontroller)
                        }
                        else
                            room_restart()
                        with (obj_music)
                            alarm[0] = 1
                        pause = 0
                    }
                    else
                        scr_soundeffect(sfx_enemyprojectile)
                }
                break
            case 1:
                scr_soundeffect(sfx_enemyprojectile)
                with (instance_create(x, y, obj_option))
                    depth = other.depth - 1
                break
            case 3:
                if (room == hub_room1 || room == characterselect || room == cowboytask || room == Titlescreen || room == Scootertransition || room == rm_levelselect || room == tower_1 || room == tower_2)
                {
                    pause = 0
                    pushadd = 0
                    with (obj_tv)
                        rank_ix = 0
                    instance_activate_all()
                    with (obj_player1)
                    {
                        character = "P"
                        scr_characterspr()
                    }
                    scr_playerreset()
                    obj_player1.state = states.titlescreen
                    obj_player2.state = states.titlescreen
                    obj_player1.targetDoor = "A"
                    if instance_exists(obj_player2)
                        obj_player2.targetDoor = "A"
                    global.cowboyhat = 0
                    with (obj_music)
                        alarm[0] = 1
                    room = Titlescreen
                    global.coop = 0
                }
                else
                {
                    pause = 0
                    pushadd = 0
                    instance_activate_all()
                    scr_playerreset()
                    global.levelreset = 1
                    obj_player.x = obj_player.backtohubstartx
                    obj_player.y = obj_player.backtohubstarty
                    if instance_exists(obj_player2)
                        obj_player2.targetDoor = "D"
                    if string_contains(room_get_name(room), "tutorial")
                        room = tower_1
                    else
                        room = tower_2
                    with (obj_camera)
                        rank_ix = 0
                    with (obj_music)
                        alarm[0] = 2
                }
                break
        }

    }
    cursor_index += 0.35
    if (cursor_index > cursor_sprite_number)
    {
        var p = cursor_index - floor(cursor_index)
        cursor_index = p
    }
    peppino_index += 0.35
    if (peppino_index > peppino_sprite_number)
    {
        p = peppino_index - floor(peppino_index)
        peppino_index = p
    }
    for (var i = 0; i < array_length(toppin_sprite); i++)
    {
        toppin_index[i] += 0.35
        if (toppin_index[i] > toppin_number[i])
        {
            var t = toppin_index[i]
            p = t - floor(t)
            toppin_index[i] = p
        }
    }
    toppin_has[0] = global.cheesefollow
    toppin_has[1] = global.pineapplefollow
    toppin_has[2] = global.sausagefollow
    toppin_has[3] = global.shroomfollow
    toppin_has[4] = global.tomatofollow
}
if (room == Titlescreen)
    pause = 0
bgyscroll += 0.25
bgxscroll += 0.25
