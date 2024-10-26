function scr_dotaunt() //gml_Script_scr_dotaunt
{
    if (key_taunt2 || input_finisher_buffer > 0)
    {
        input_finisher_buffer = 0
        if (!finisher)
        {
            taunttimer = 15
            tauntstoredmovespeed = movespeed
            tauntstoredvsp = vsp
            if (swapped == 0)
                tauntstoredsprite = sprite_index
            tauntstoredstate = state
            state = states.tauntmoves
            if (supercharged && key_up)
            {
                if (character != "V")
                {
                    image_index = 0
                    scr_soundeffect(sfx_supertaunt)
                    camera_zoom(0.75, 0.5)
                    audio_stop_sound(sfx_taunt)
                    sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4, spr_supertaunt5)
                }
                else if (character == "V")
                {
                    audio_play_sound(sfx_taunt, 1, false, global.option_sfx_volume, 0, irandom_range(1.1, 0.88))
                    taunttimer = 20
                    sprite_index = spr_taunt
                    image_index = irandom_range(0, 12)
                }
            }
            else
            {
                audio_play_sound(sfx_taunt, 1, false, global.option_sfx_volume, 0, choose(1.1, 1.05, 1, 1, 0.95, 0.9))
                taunttimer = 20
                sprite_index = spr_taunt
                tauntroll = random_range(0, 12)
                image_index = tauntroll
                if (image_index > 11 && character == "P")
                    PROMOTION = 1
            }
            with (instance_create(x, y, obj_taunteffect))
                player = other.id
        }
    }
    return;
}

