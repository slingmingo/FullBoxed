function scr_cheesedragon_groundpound() //gml_Script_scr_cheesedragon_groundpound
{
    if (sprite_index == spr_cheesedragon_stomp)
    {
        if (y != 200)
            y = lerp(y, 220, 0.3)
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_cheesedragon_stompfall
            scr_soundeffect(sfx_groundpoundloop)
            image_index = 0
        }
    }
    if (sprite_index == spr_cheesedragon_stompfall)
    {
        vsp += 0.7
        if (y >= 350)
        {
            sprite_index = spr_cheesedragon_stompland
            with (obj_camera)
            {
                shake_mag = 5
                shake_mag_acc = 15 / room_speed
            }
            vulnerable = 0
            scr_soundeffect(sfx_groundpound)
            with (instance_create((x + 64), (y + 80), obj_dragonshockwave))
                image_xscale = 1
            with (instance_create((x - 64), (y + 80), obj_dragonshockwave))
                image_xscale = -1
            with (instance_create((x - 64), (y + 80), obj_bigspitcheesespike))
            {
                image_xscale = -1
                hsp = 4
                vsp = -16
            }
            with (instance_create((x + 64), (y + 80), obj_bigspitcheesespike))
            {
                image_xscale = 1
                hsp = -4
                vsp = -16
            }
            audio_stop_sound(sfx_groundpoundloop)
        }
    }
    if (sprite_index == spr_cheesedragon_stompland)
    {
        vsp = 0
        if (floor(image_index) == (image_number - 1))
        {
            if (phase2 == 1)
            {
                vulnerable = 1
                sprite_index = spr_cheesedragon_stomprecover
            }
            if (pulses == 0 && phase2 == 0)
            {
                state = "stun"
                alarm[2] = 150
                vulnerable = 1
                sprite_index = spr_cheesedragon_stompstun
            }
            else if (phase2 == 0)
            {
                pulses -= 1
                image_index = 0
                with (instance_create((x + 64), (y + 80), obj_dragonshockwave))
                    image_xscale = 1
                with (instance_create((x - 64), (y + 80), obj_dragonshockwave))
                    image_xscale = -1
                with (instance_create((x - 64), (y + 80), obj_bigspitcheesespike))
                {
                    image_xscale = -1
                    hsp = 8
                    vsp = -16
                }
                with (instance_create((x + 64), (y + 80), obj_bigspitcheesespike))
                {
                    image_xscale = 1
                    hsp = -8
                    vsp = -16
                }
            }
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesedragon_stomprecover && phase2 == 1)
    {
        state = "idle"
        sprite_index = spr_cheesedragon_idle
        if (side == 1)
            side = 0
        else
            side = 1
        vsp = 0
    }
}

