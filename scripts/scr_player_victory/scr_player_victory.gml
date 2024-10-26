function scr_player_victory() //gml_Script_scr_player_victory
{
    hsp = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    if (sprite_index == spr_player_levelcomplete)
    {
        if (vsp < 20)
            vsp += grav
    }
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    global.heattime = 60
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_levelcomplete)
        image_speed = 0
    if (place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_geromedoor))
        sprite_index = spr_victory
    if place_meeting(x, y, obj_startgate)
        sprite_index = spr_entergate
    if (floor(image_index) == (image_number - 1))
        image_speed = 0
    else
        image_speed = 0.35
    return;
}

