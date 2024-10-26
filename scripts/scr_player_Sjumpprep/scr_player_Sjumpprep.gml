function scr_player_Sjumpprep() //gml_Script_scr_player_Sjumpprep
{
    reboundvsp = 0
    switch character
    {
        case "D":
            vsp = 0
            pogochargeactive = 0
            pogocharge = 50
            if (floor(image_index) == (image_number - 1))
            {
                if (sprite_index == spr_playerN_jetpackstart)
                {
                    if (pizzapepper == 0)
                    {
                        scr_soundeffect(sfx_sjumpreleaseN)
                        audio_stop_sound(sfx_sjumprepN)
                        state = states.mach3
                        sprite_index = spr_playerN_jetpackboost
                        instance_create(x, y, obj_jumpdust)
                        movespeed = 16
                        initialboost = 5
                    }
                    else
                    {
                        scr_soundeffect(sfx_sjumpreleaseN)
                        audio_stop_sound(sfx_sjumprepN)
                        state = states.mach3
                        sprite_index = spr_crazyrun
                        instance_create(x, y, obj_jumpdust)
                        movespeed = 21
                    }
                }
                else if (sprite_index == spr_superjumpprep)
                {
                    hsp = 0
                    image_speed = 0.4
                    image_index = 0
                    scr_soundeffect(sfx_sjumpreleaseN)
                    audio_stop_sound(sfx_sjumprepN)
                    instance_create(x, y, obj_explosioneffect)
                    if (character != "P")
                        sprite_index = spr_superjump
                    else
                        sprite_index = spr_player_superjumpintro
                    state = states.Sjump
                    vsp = -15
                }
            }
            if (sprite_index == spr_playerN_jetpackstart)
                image_speed = 0.5
            else
                image_speed = 0.3
            break
        case "P":
        case "N":
        case "S":
            if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
                move = key_left + key_right
            else
                move = xscale
            if (!(place_meeting(x, (y + 1), obj_railparent)))
                hsp = move * movespeed
            else
            {
                var _railinst = instance_place(x, (y + 1), obj_railparent)
                hsp = move * movespeed + _railinst.movespeed * _railinst.dir
            }
            if (sprite_index == spr_superjumpprep && movespeed > 0)
                movespeed -= 1
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
                sprite_index = spr_superjumppreplight
            if (sprite_index == spr_superjumppreplight)
                movespeed = 2
            if (sprite_index != spr_superjumpprep)
            {
                if (move != 0 && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft))
                {
                    if (xscale == 1)
                    {
                        if key_right
                            sprite_index = spr_superjumpright
                        if (-key_left)
                            sprite_index = spr_superjumpleft
                    }
                    if (xscale == -1)
                    {
                        if key_right
                            sprite_index = spr_superjumpleft
                        if (-key_left)
                            sprite_index = spr_superjumpright
                    }
                }
                else
                    sprite_index = spr_superjumppreplight
            }
            if ((!key_up) && (character == "S" || sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright || sprite_index == spr_player_sjumpfall) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
            {
                if (character != "N")
                    scr_soundeffect(sfx_superjumprelease)
                else
                    scr_soundeffect(sfx_sjumpreleaseN)
                instance_create(x, y, obj_explosioneffect)
                sprite_index = spr_superjump
                state = states.Sjump
                if (hyperpeppino == 0)
                {
                    if (!inbackground)
                        vsp = -17
                    else
                        vsp = -8.5
                }
                else if (!inbackground)
                    vsp = -30
                else
                    vsp = -15
                image_index = 0
            }
            image_speed = 0.35
            break
        case "NE":
            vsp = 0
            hsp = 0
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_noisettestick_helicopter
                if (!inbackground)
                    vsp = -22
                else
                    vsp = -11
                state = states.jump
                NEsjump = 1
            }
            break
    }

    if (!audio_is_playing(superjumpholdsnd))
    {
        if (character != "N")
        {
            superjumpholdsnd = audio_play_sound(sfx_superjumphold, 1, false)
            sfx_gain(superjumpholdsnd)
        }
        else
        {
            superjumpholdsnd = audio_play_sound(sfx_sjumprepN, 1, false)
            sfx_gain(superjumpholdsnd)
        }
    }
    return;
}

