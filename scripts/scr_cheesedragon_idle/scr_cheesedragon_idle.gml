function scr_cheesedragon_idle() //gml_Script_scr_cheesedragon_idle
{
    image_speed = 0.4
    if (side == 0)
        xfinal = 200
    else
        xfinal = 725
    audio_stop_sound(sfx_vulnerable)
    if (y != 205)
    {
        y = lerp(y, 205, 0.05)
        vulnerable = 1
    }
    else
        vulnerable = 0
    if (x == xfinal)
    {
        sprite_index = spr_cheesedragon_turn
        if (attack == lastattack)
            attack = choose(1, 2, 3)
    }
    else if (phase2 == 0)
        x = Approach(x, xfinal, 6)
    else
        x = Approach(x, xfinal, 7)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_turn && x == xfinal && attack != lastattack)
    {
        lastattack = attack
        image_index = 0
        if (attack == 1)
        {
            state = "groundpound"
            sprite_index = spr_cheesedragon_stomp
            scr_soundeffect(sfx_dragon_slam)
            if (obj_bosscontroller.bosshp <= 5 && phase2 == 0)
                pulses = 1
            if (phase2 == 1)
                pulses = 1
        }
        if (attack == 2)
        {
            state = "flames"
            sprite_index = spr_cheesedragon_flames
            scr_soundeffect(sfx_dragon_fire_noloop)
        }
        if (attack == 3)
        {
            state = "headbutt"
            vsp = -10
            sprite_index = spr_cheesedragon_intoheadbutt
        }
        image_xscale = (-image_xscale)
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_stomprecover)
        sprite_index = spr_cheesedragon_idle
}

