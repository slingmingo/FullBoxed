with (obj_player1)
{
    if (shotgunAnim == 1)
    {
        if (state != states.normal && state != states.crouch && state != states.shotgunfreefall && state != states.freefallland && state != states.jump && state != states.handstandjump && sprite_index != spr_player_shotgun)
            other.visible = true
        else
            other.visible = false
    }
    other.x = x - 15 * xscale
    other.y = y
    other.image_xscale = (-xscale)
}
if obj_player.inbackground
{
    image_xscale = obj_player.xscale * obj_player.scale_xs
    image_yscale = obj_player.yscale * obj_player.scale_ys
}
if (room == rank_room)
    visible = false
