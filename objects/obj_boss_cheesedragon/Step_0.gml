y += vsp
x += hsp
if instance_exists(obj_deathfadeout)
    instance_deactivate_object(self)
switch state
{
    case "intro":
        scr_cheesedragon_intro()
        break
    case "idle":
        scr_cheesedragon_idle()
        break
    case "groundpound":
        scr_cheesedragon_groundpound()
        break
    case "flames":
        scr_cheesedragon_flames()
        break
    case "stun":
        scr_cheesedragon_stun()
        break
    case "damaged":
        scr_cheesedragon_damaged()
        break
    case "headbutt":
        scr_cheesedragon_headbutt()
        break
    case "transitioncutscene":
        scr_cheesedragon_transitioncutscene()
        break
}

if (sprite_index == spr_cheesedragon_explode || obj_bosscontroller.bosshp == 0)
    state = "transitioncutscene"
if (phase2 == 0)
{
    if (place_meeting(x, y, obj_charcoalthrowable) && state != "stun" && state != "damaged" && obj_charcoalthrowable.state == states.stun && (!obj_charcoalthrowable.grounded) && sprite_index != spr_cheesedragon_headbutt && state != "transitioncutscene")
    {
        state = "stun"
        image_index = 0
        scr_soundeffect(sfx_stompenemy)
        sprite_index = spr_cheesedragon_stun
        vsp = -9
        hsp = 3 * image_xscale
        vulnerable = 1
        alarm[2] = 150
    }
}
else if (place_meeting(x, y, enemyid) && (!enemyid.grounded) && enemyid.state == states.stun && sprite_index != spr_cheesedragon_headbutt && sprite_index != spr_cheesedragon_bgatkfal && state != "stun" && state != "damaged" && state != "transitioncutscene")
{
    state = "stun"
    image_index = 0
    scr_soundeffect(sfx_stompenemy)
    sprite_index = spr_cheesedragon_stun
    vsp = -9
    hsp = 3 * image_xscale
    vulnerable = 1
    alarm[2] = 150
}
if (place_meeting(x, y, obj_player) && (obj_player.state == states.handstandjump || obj_player.state == 276 || obj_player.state == states.punch) && state == "stun")
{
    if (obj_bosscontroller.bosshp > 1)
    {
        obj_bosscontroller.bosshp -= 1
        scr_soundeffect(sfx_killingblow)
        scr_soundeffect(sfx_dragonhit)
        if (obj_bosscontroller.bosshp == 8 || obj_bosscontroller.bosshp == 6 || obj_bosscontroller.bosshp == 4 || obj_bosscontroller.bosshp == 2)
        {
            with (instance_create(x, y, obj_healthcollect))
            {
                vsp = -8
                hsp = choose(4, -4)
            }
        }
        state = "damaged"
        image_index = 0
        vsp = -6
        alarm[2] = 90
        hsp = 16 * image_xscale
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
        state = "phase2"
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
    else if (phase2 == 1)
    {
        image_speed = 0.4
        image_index = 0
        layer_set_visible(layer_get_id("P21"), false)
        layer_set_visible(layer_get_id("P22"), false)
        layer_set_visible(layer_get_id("P23"), false)
        layer_set_visible(layer_get_id("P24"), false)
        image_xscale = 1
        phase2 = 0
        vsp = 0
        obj_bosscontroller.bosshp--
        hsp = 0
        with (obj_pizzamancer)
        {
            sprite_index = spr_pizzamancer_dead
            y = 480
        }
        audio_stop_sound(mu_dragonphase2)
        scr_soundeffect(sfx_dragonhit)
        scr_music(mu_wind)
        instance_create(0, 0, obj_flash)
        with (obj_player)
        {
            x = 213
            y = 432
            state = states.normal
            sprite_index = spr_idle
            xscale = 1
        }
        x = 672
        y = 352
        state = "transitioncutscene"
        sprite_index = spr_cheesedragon_explode
    }
}
if (sprite_index == spr_cheesedragon_2intro1 && floor(image_index) == (image_number - 1))
{
    state = "idle"
    sprite_index = spr_cheesedragon_idle
}
