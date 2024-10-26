hsp = image_xscale * movespeed
mask_index = spr_player_mask
if (scr_solid(x, (y + 1)) && vsp > 0)
{
    vsp = (-rebound)
    rebound /= 2
    if (movespeed > 0)
        movespeed -= 1
}
if (place_meeting((x + hsp), y, obj_solid) || place_meeting((x + hsp), (y + vsp), obj_destructibles) || place_meeting(x, y, obj_baddie))
    image_xscale *= -1
if (place_meeting((x + hsp), (y + vsp), obj_metalblock) || place_meeting((x + hsp), (y + vsp), obj_metalblockescape) || place_meeting((x + hsp), (y + vsp), obj_ratblock))
    instance_destroy()
if (countdown <= 0)
    instance_destroy()
if (obj_player.key_shoot2 && countdown < 280)
    instance_destroy()
if (sprite_index == spr_dynamite && countdown < 30)
    sprite_index = spr_dynamiteabouttoexplode
if (countdown > 0)
    countdown--
scr_collision()
