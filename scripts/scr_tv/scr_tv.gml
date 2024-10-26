function tv_set_idle() //gml_Script_tv_set_idle
{
    with (obj_tv)
    {
        state = states.normal
        sprite_index = spr_tv_off
    }
    return;
}

function tv_create_prompt(argument0, argument1, argument2, argument3) //gml_Script_tv_create_prompt
{
    return [argument0, argument1, argument2, argument3];
}

function tv_push_prompt(argument0, argument1, argument2, argument3) //gml_Script_tv_push_prompt
{
    with (obj_tv)
    {
        var b = [argument0, argument1, argument2, argument3]
        var play = 0
        switch argument1
        {
            case 0:
                play = 1
                ds_list_insert(tvprompts_list, 0, b)
                break
            case 1:
                var placed = 0
                var i = 0
                while (i < ds_list_size(tvprompts_list))
                {
                    var b2 = ds_list_find_value(tvprompts_list, i)
                    if (b2[1] == 2)
                    {
                        if (i == 0)
                            play = 1
                        ds_list_insert(tvprompts_list, i, b)
                        placed = 1
                        break
                    }
                    else
                        i++
                }
                if (!placed)
                    ds_list_add(tvprompts_list, b)
                break
            case 2:
                ds_list_add(tvprompts_list, b)
                break
        }

        if play
            state = states.normal
    }
    return;
}

function tv_push_prompt_array(argument0) //gml_Script_tv_push_prompt_array
{
    var i = 0
    var b = 0
    for (i = 0; i < array_length(argument0); i++)
    {
        with (obj_tv)
        {
            b = argument0[i]
            tv_push_prompt(b[0], b[1], b[2], b[3])
        }
    }
    return;
}

function tv_default_condition() //gml_Script_tv_default_condition
{
    return place_meeting(x, y, obj_player);
}

function tv_push_prompt_once(argument0, argument1) //gml_Script_tv_push_prompt_once
{
    with (obj_tv)
    {
        if (special_prompts == -4)
            return 0;
        b = ds_map_find_value(special_prompts, argument1)
        if is_undefined(b)
            return 0;
        if (b != 1)
        {
            tv_push_prompt(argument0[0], argument0[1], argument0[2], argument0[3])
            ds_map_set(special_prompts, argument1, 1)
            ini_open("LevelData")
            ini_write_real("Prompts", argument1, 1)
            ini_close()
            return 1;
        }
        return 0;
    }
}

function tv_do_expression(argument0) //gml_Script_tv_do_expression
{
    with (obj_tv)
    {
        if (expressionsprite != argument0 && bubblespr == -4)
        {
            state = 250
            expressionsprite = argument0
            sprite_index = spr_tv_whitenoise
            switch expressionsprite
            {
                case spr_tv_exprhurt:
                case spr_tv_exprhurtN:
                case spr_tv_hurtG:
                    expressionbuffer = 60
                    break
                case spr_tv_exprcollect:
                case spr_tv_exprcollectN:
                case spr_tv_mushroom:
                case spr_tv_cheese:
                case spr_tv_tomato:
                case spr_tv_sausage:
                case spr_tv_pineapple:
                    expressionbuffer = 150
                    if obj_player.isgustavo
                        expressionsprite = spr_tv_happyG
                    break
                case spr_tv_john:
                    expressionbuffer = 5
                    break
            }

        }
    }
    return;
}

