if (obj_player.key_up2 && obj_gamestarter.ispressed == 0)
{
    global.swapmode = 0
    sprite_index = spr_mainmenu_pepicon
}
if (obj_player.key_down2 && obj_gamestarter.ispressed == 0)
{
    global.swapmode = 1
    sprite_index = spr_mainmenu_swapicon
}
