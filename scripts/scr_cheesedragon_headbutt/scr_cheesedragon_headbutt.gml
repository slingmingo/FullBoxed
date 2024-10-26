function scr_cheesedragon_headbutt() //gml_Script_scr_cheesedragon_headbutt
{
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_intoheadbutt)
    {
        sprite_index = spr_cheesedragon_headbutt
        image_index = 0
        scr_soundeffect(sfx_dragon_headbutt)
        vsp = 0
        image_speed = 0.28
        x = obj_player.x
        y = 365
    }
    if (sprite_index == spr_cheesedragon_headbutt)
    {
        if (image_index < 17)
            x = obj_player.x
        if (image_index > 32)
            vulnerable = 0
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_headbutt)
    {
        if (phase2 == 0)
        {
            sprite_index = spr_cheesedragon_bgatkstun
            vulnerable = 1
        }
        else
        {
            sprite_index = spr_cheesedragon_bgatkfal
            depth = 150
            vulnerable = 1
        }
    }
    if (place_meeting(x, y, obj_player) && (obj_player.state == states.handstandjump || obj_player.state == states.punch) && sprite_index == spr_cheesedragon_bgatkstun)
    {
        if (obj_bosscontroller.bosshp > 1)
        {
            obj_bosscontroller.bosshp -= 1
            sprite_index = spr_cheesedragon_bgatkhit
            image_speed = 0.4
            scr_soundeffect(sfx_killingblow)
            scr_soundeffect(sfx_dragonhit)
            image_index = 0
            if (obj_player.state == states.handstandjump)
            {
                with (obj_player)
                {
                    state = states.blackbelt
                    movespeed = -10 * xscale
                    image_index = 0
                    inv_frames = 1
                    invhurt_buffer = 120
                    with (obj_camera)
                    {
                        shake_mag = 3
                        shake_mag_acc = 8 / room_speed
                    }
                    alarm[8] = 60
                    alarm[7] = 120
                    hurted = 1
                    image_speed = 0.35
                    if grounded
                        sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3)
                    else
                    {
                        sprite_index = spr_kungfujump
                        vsp = -6
                    }
                }
            }
        }
        else if (phase2 == 0)
        {
            state = "transitioncutscene"
            hsp = 0
            alarm[1] = 0
            alarm[2] = 0
            vsp = 0
            scr_soundeffect(sfx_killingblow)
            scr_soundeffect(sfx_dragonhit)
            scr_soundeffect(sfx_blackoutpunch)
            alarm[3] = 120
            obj_drawcontroller.superattacking = 1
            sprite_index = spr_cheesedragon_stun
            x = obj_player.x + 120 * obj_player.xscale
            image_xscale = obj_player.xscale
            y = obj_player.y
            with (obj_player)
            {
                sprite_index = spr_finishingblow1
                image_speed = 0
                image_index = 0
                state = states.titlescreen
                vsp = 0
                hsp = 0
            }
        }
    }
    if (sprite_index == spr_cheesedragon_bgatkhit && image_index > 16)
        depth = 150
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_cheesedragon_bgatkhit || sprite_index == spr_cheesedragon_bgatkfal))
    {
        y = 600
        if (side == 0)
            xfinal = 725
        else
            xfinal = 200
        vsp = -9
        depth = 0
        sprite_index = spr_cheesedragon_goingup
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_goingup)
    {
        sprite_index = spr_cheesedragon_idle
        image_speed = 0.4
        state = "idle"
        vsp = 0
    }
}

