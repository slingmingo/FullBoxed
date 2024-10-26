switch state
{
    case states.normal:
        if (obj_player1.x <= x)
        {
            state = 145
            round_count = 10
            with (obj_arenagate)
            {
                sprite_index = spr_arenagate_close
                image_index = 0
                block_inst = instance_create(x, y, obj_solid)
                with (block_inst)
                {
                    sprite_index = spr_arenagate_open
                    image_xscale = other.image_xscale
                    image_yscale = other.image_yscale
                }
            }
        }
        break
    case states.arenaintro:
        with (obj_player)
            state = states.gottreasure
        if (cutscene_count > 0)
            cutscene_count--
        else
        {
            with (obj_player)
            {
                state = states.normal
                image_index = 0
            }
            state = 145
            round_count = 10
        }
        break
    case 145:
        if (round_count > 0)
            round_count--
        else
            state = 142
        break
    case 142:
        if (!ds_list_empty(baddielist))
        {
            for (var i = 0; i < ds_list_size(baddielist); i++)
            {
                var b = ds_list_find_value(baddielist, i)
                if (b[0] == gml_Script_wave)
                {
                    instance_activate_object(b[1])
                    if instance_exists(b[1])
                    {
                        with (instance_create(b[1].x, b[1].y, obj_arena_pizzaportal))
                        {
                            stored_id = b[1]
                            alarm[0] = other.round_max
                        }
                        instance_deactivate_object(b[1])
                    }
                }
                else
                    instance_deactivate_object(b[1])
            }
        }
        wave_minutes = minutes
        wave_seconds = seconds
        round_count = round_max
        state = 143
        with (obj_arenadoor)
        {
            wave = other.wave
            alarm[0] = 10
            finish = 0
            if (objectlist[gml_Script_wave] == noone)
            {
                alarm[0] = -1
                finish = 1
            }
        }
        break
    case 143:
        var _doorfinish = 1
        with (obj_arenadoor)
        {
            if (!finish)
                _doorfinish = 0
        }
        if ((!instance_exists(obj_baddie)) && (!instance_exists(obj_arena_pizzaportal)) && ((!instance_exists(obj_arenadoor)) || _doorfinish))
        {
            wave++
            if (gml_Script_wave > maxwave)
            {
                instance_destroy()
                instance_destroy(block_inst)
                with (obj_arenagate)
                {
                    image_index = 0
                    sprite_index = spr_arenagate_open
                    instance_destroy(block_inst)
                }
                cutscene_count = outro_max
                with (obj_player)
                {
                    with (obj_music)
                        arena = 0
                }
            }
            else
            {
                state = 142
                round_count = round_max
            }
        }
        break
    case states.transitioncutscene:
        if (floor(image_index) == (image_number - 1))
            state = states.victory
        break
    case states.victory:
        instance_destroy()
        break
}

if (state != states.normal && state != states.arenaintro)
    visible = false
