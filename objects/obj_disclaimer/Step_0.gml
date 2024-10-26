if (fadein == true && fadealpha > 0)
    fadealpha -= 0.05
if (fadein == false && fadealpha < 1)
    fadealpha += 0.05
if (fadein == false && fadealpha >= 1)
    scr_room_goto(Titlescreen)
if keyboard_check_pressed(vk_anykey)
    fadein = false
