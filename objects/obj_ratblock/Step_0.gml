image_speed = 0.35
if (sprite_index != spr_rattumbleblock && sprite_index != spr_rattumbleblock_big && sprite_index != spr_ratblock6)
    mask_index = spr_ratblock1
else
    mask_index = sprite_index
if anim
    animy = Approach(animy, -10, 1.5)
else
    animy = Approach(animy, 0, 1.5)
if (animy == -10)
    anim = 0
if place_meeting((x + (-obj_player.xscale)), y, obj_player)
{
    with (obj_player)
    {
        if (state == states.shoulderbash || state == states.machroll)
            instance_destroy(other)
    }
}
