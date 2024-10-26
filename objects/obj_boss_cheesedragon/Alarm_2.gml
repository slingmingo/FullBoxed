if (state != "transitioncutscene")
{
    state = "idle"
    vulnerable = 0
    if (state == "groundpound")
        sprite_index = spr_cheesedragon_stomprecover
    else
        sprite_index = spr_cheesedragon_idle
    vsp = 0
    hsp = 0
}
