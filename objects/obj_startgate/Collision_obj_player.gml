switch targetRoom
{
    case space_1:
        global.levelcompletename = "SPACE"
        break
    case forest_1:
        global.levelcompletename = "FOREST"
        break
    case chateau_1R:
        global.levelcompletename = "CHATEAU"
        break
    default:
        global.levelcompletename = -4
        break
}

with (obj_player1)
{
    if (state == states.victory)
        camera_zoom(0.01, 0.01)
    if (place_meeting(x, y, other) && key_up && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != states.victory && state != states.comingoutdoor && obj_player1.spotlight == 1)
    {
        audio_stop_all()
        global.leveltosave = other.level
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = states.victory
        obj_player.backtohubstartx = x
        obj_player.backtohubstarty = y
        obj_player.backtohubroom = room
        if (global.coop == 1)
        {
            with (obj_player2)
            {
                x = obj_player1.x
                y = obj_player1.y
                mach2 = 0
                obj_camera.chargecamera = 0
                image_index = 0
                state = states.victory
            }
        }
    }
}
with (obj_player2)
{
    if (place_meeting(x, y, other) && key_up && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != states.victory && state != states.comingoutdoor && obj_player1.spotlight == 0)
    {
        audio_stop_all()
        global.leveltorestart = other.targetRoom
        global.leveltosave = other.level
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = states.victory
        obj_player1.backtohubstartx = x
        obj_player1.backtohubstarty = y
        obj_player1.backtohubroom = room
        if (global.coop == 1)
        {
            with (obj_player1)
            {
                x = obj_player2.x
                y = obj_player2.y
                mach2 = 0
                obj_camera.chargecamera = 0
                image_index = 0
                state = states.victory
            }
        }
    }
}
if ((floor(obj_player1.image_index) == (obj_player1.image_number - 1) && obj_player1.state == states.victory) || (floor(obj_player2.image_index) == (obj_player2.image_number - 1) && obj_player2.state == states.victory))
{
    with (obj_player)
    {
        if (other.level == "snickchallenge")
        {
            global.wave = 0
            global.maxwave = (global.minutes * 60 + global.seconds) * 60
            if global.panicbg
                scr_panicbg_init()
            global.snickchallenge = 1
            global.collect = 10000
            with (obj_camera)
            {
                alarm[1] = 60
                global.seconds = 59
                global.minutes = 9
            }
        }
        obj_music.fadeoff = 0
        targetDoor = "A"
        targetRoom = other.targetRoom
    }
    if (level != "tutorial")
    {
        if (!instance_exists(obj_titlecard))
        {
            with (instance_create(0, 0, obj_titlecard))
            {
                cardsprite = other.cardsprite
                cardmusic = other.cardmusic
            }
        }
    }
    else if (!instance_exists(obj_fadeout))
        instance_create(0, 0, obj_fadeout)
}
