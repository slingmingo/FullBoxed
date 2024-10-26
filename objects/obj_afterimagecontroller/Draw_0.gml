for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        if visible
        {
            var a = other.alpha[identifier]
            if (identifier == 3)
            {
                a = alpha
                if (obj_player1.state != states.clown)
                    shader_set(shd_firemouth_afterimage)
                else
                    shader_set(shd_clown_afterimage)
            }
            else if (identifier == 4)
            {
                a = alpha
                with (obj_player1)
                {
                    if (character == "P")
                    {
                        switch paletteselect
                        {
                            case 1:
                                with (other)
                                    shader_set(shd_white_afterimage)
                                break
                            case 2:
                                with (other)
                                    shader_set(shd_red_afterimage)
                                break
                            case 3:
                                with (other)
                                    shader_set(shd_orange_afterimage)
                                break
                            case 4:
                                with (other)
                                    shader_set(shd_yellow_afterimage)
                                break
                            case 5:
                                with (other)
                                    shader_set(shd_green_afterimage)
                                break
                            case 6:
                                with (other)
                                    shader_set(shd_blue_afterimage)
                                break
                            case 7:
                                with (other)
                                    shader_set(shd_purple_afterimage)
                                break
                            case 8:
                                with (other)
                                    shader_set(shd_clown_afterimage)
                                break
                            case 9:
                                with (other)
                                    shader_set(shd_black_afterimage)
                                break
                            case 10:
                                with (other)
                                    shader_set(shd_yellow_afterimage)
                                break
                            case 11:
                                with (other)
                                    shader_set(shd_white_afterimage)
                                break
                            case 12:
                                with (other)
                                    shader_set(shd_yellow_afterimage)
                                break
                            case 13:
                                with (other)
                                    shader_set(shd_green_afterimage)
                                break
                            case 14:
                                with (other)
                                    shader_set(shd_red_afterimage)
                                break
                            case 15:
                                with (other)
                                    shader_set(shd_noise_afterimage)
                                break
                        }

                    }
                    if (character == "N")
                    {
                        switch paletteselect
                        {
                            case 1:
                            case 2:
                                with (other)
                                    shader_set(shd_noise_afterimage)
                                break
                            case 3:
                                with (other)
                                    shader_set(shd_orange_afterimage)
                                break
                            case 4:
                                with (other)
                                    shader_set(shd_white_afterimage)
                                break
                            case 5:
                                with (other)
                                    shader_set(shd_purple_afterimage)
                                break
                            case 6:
                                with (other)
                                    shader_set(shd_orange_afterimage)
                                break
                            case 7:
                                with (other)
                                    shader_set(shd_green_afterimage)
                                break
                            case 8:
                                with (other)
                                    shader_set(shd_red_afterimage)
                                break
                            case 9:
                                with (other)
                                    shader_set(shd_blue_afterimage)
                                break
                            case 10:
                                with (other)
                                    shader_set(shd_clown_afterimage)
                                break
                        }

                    }
                    if (character == "D")
                    {
                        with (other)
                            shader_set(shd_blue_afterimage)
                    }
                    if (character == "V")
                    {
                        with (other)
                            shader_set(shd_orange_afterimage)
                    }
                    if (character == "M")
                    {
                        with (other)
                            shader_set(shd_red_afterimage)
                    }
                }
            }
            else if (identifier == 5)
            {
                a = alpha
                if instance_exists(playerid)
                {
                    if (playerid != noone && playerid.object_index != obj_pepgoblin)
                    {
                        shader_set(global.Pal_Shader)
                        pal_swap_set(playerid.spr_palette, playerid.paletteselect, 0)
                    }
                }
            }
            draw_sprite_ext(sprite_index, image_index, x, y, (obj_player.xscale * obj_player.scale_xs), (obj_player.yscale * obj_player.scale_ys), 0, image_blend, a)
            if (identifier == 3 || identifier == 4 || (identifier == 5 && playerid != noone))
                shader_reset()
        }
    }
}
