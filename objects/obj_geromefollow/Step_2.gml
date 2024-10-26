if (sprite_index != spr_gerome_collected)
{
    event_inherited()
    yoffset = 0
    sprite_index = (x != xprevious ? spr_gerome_keymove : spr_gerome_keyidle)
    if ((xprevious - x) != 0)
        image_xscale = (-(sign(xprevious - x)))
    else if (playerid.hsp == 0)
        image_xscale = playerid.xscale
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_gerome_collected)
    sprite_index = spr_gerome_keyidle
