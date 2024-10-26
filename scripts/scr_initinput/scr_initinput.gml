function scr_initinput() //gml_Script_scr_initinput
{
    ini_open("saveData.ini")
    global.key_up = ini_read_string("ControlsKeys", "up", 38)
    global.key_right = ini_read_string("ControlsKeys", "right", 39)
    global.key_left = ini_read_string("ControlsKeys", "left", 37)
    global.key_down = ini_read_string("ControlsKeys", "down", 40)
    global.key_jump = ini_read_string("ControlsKeys", "jump", 90)
    global.key_slap = ini_read_string("ControlsKeys", "slap", 88)
    global.key_taunt = ini_read_string("ControlsKeys", "taunt", 67)
    global.key_shoot = ini_read_string("ControlsKeys", "shoot", 65)
    global.key_attack = ini_read_string("ControlsKeys", "attack", 16)
    global.key_start = ini_read_string("ControlsKeys", "start", 27)
    global.key_chainsaw = ini_read_string("ControlsKeys", "chainsaw", 86)
    global.key_upC = ini_read_string("ControllerButton", "up", 32781)
    global.key_rightC = ini_read_string("ControllerButton", "right", 32784)
    global.key_leftC = ini_read_string("ControllerButton", "left", 32783)
    global.key_downC = ini_read_string("ControllerButton", "down", 32782)
    global.key_jumpC = ini_read_string("ControllerButton", "jump", 32769)
    global.key_slapC = ini_read_string("ControllerButton", "slap", 32771)
    global.key_tauntC = ini_read_string("ControllerButton", "taunt", 32772)
    global.key_shootC = ini_read_string("ControllerButton", "shoot", 32770)
    global.key_attackC = ini_read_string("ControllerButton", "attack", 32774)
    global.key_startC = ini_read_string("ControllerButton", "start", 32778)
    global.key_chainsawC = ini_read_string("ControllerButton", "chainsaw", 32773)
    ini_close()
    return;
}

