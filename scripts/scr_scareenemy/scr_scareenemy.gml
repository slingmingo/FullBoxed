function scr_scareenemy() //gml_Script_scr_scareenemy
{
    var player = instance_nearest(x, y, obj_player)
    if (state != states.grabbed && state != states.stun && state != states.hit && state != states.clown)
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && ((player.xscale > 0 && x >= player.x) || (player.xscale < 0 && x <= player.x)))
        {
            if (sprite_index != scaredspr && state != states.stun && state != states.staggered && (player.state == states.chainsawbump || player.state == states.mach3 || player.state == states.shoulderbash || player.state == states.hypersoar || player.state == states.rideweenie || player.state == states.rocket || player.state == states.tacklecharge || player.state == states.knightpepslopes || (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
            {
                state = states.idle
                scr_soundeffect(choose(-4, -4, -4, -4, -4, sfx_enemyrarescream, -4, sfx_enemyrarescream2))
                sprite_index = scaredspr
                if (x != player.x)
                    image_xscale = (-(sign(x - player.x)))
                scaredbuffer = 100
                if grounded
                    vsp = -3
            }
        }
    }
    return;
}
