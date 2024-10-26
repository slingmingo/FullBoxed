function draw_sprite_ext_flash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //gml_Script_draw_sprite_ext_flash
{
    gpu_set_fog(true, argument7, 0, 1)
    draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
    gpu_set_fog(false, c_black, 0, 0)
    return;
}

