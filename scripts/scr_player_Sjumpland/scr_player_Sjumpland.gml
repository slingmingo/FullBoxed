function scr_player_Sjumpland() //gml_Script_scr_player_Sjumpland
{
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    machslideAnim = 1
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    movespeed = 0
    start_running = 1
    alarm[4] = 14
    if (sprite_index != spr_bombpepend)
        vsp = 0
    else
        vsp = 10
    hsp = 0
    if (floor(image_index) == 6 && sprite_index != spr_bombpepend && sprite_index != spr_squished)
    {
        if (character != "D")
        {
            sprite_index = spr_machfreefall
            state = states.jump
            jumpAnim = 0
        }
        else
        {
            sprite_index = spr_playerN_jetpackboostdown
            repeat irandom_range(1, 3)
                create_heatpuff((x + (irandom_range(-24, 24))), (y + 40))
            alarm[11] = 10
            state = states.Sjump
        }
    }
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_bombpepend || sprite_index == spr_squished))
    {
        state = states.normal
        jumpAnim = 0
    }
    return;
}

