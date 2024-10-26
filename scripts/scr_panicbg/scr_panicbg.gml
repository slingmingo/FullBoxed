function panicbg_starte() //gml_Script_panicbg_starte
{
    if (event_type == 8 && event_number == 0)
    {
        var WAVELENGTH = shader_get_uniform(shd_panicbg, "WAVELENGTH")
        var AMPLITUDE = shader_get_uniform(shd_panicbg, "AMPLITUDE")
        var TINTAMOUNT = shader_get_uniform(shd_panicbg, "TINTAMOUNT")
        var TINTSPEED = shader_get_uniform(shd_panicbg, "TINTSPEED")
        shader_set(shd_panicbg)
        shader_set_uniform_f(TINTSPEED, 2)
        shader_set_uniform_f(WAVELENGTH, 50)
        shader_set_uniform_f(AMPLITUDE, 0.1)
        shader_set_uniform_f(TINTAMOUNT, 0.5)
    }
    return;
}

function panicbg_ende() //gml_Script_panicbg_ende
{
    if (event_type == 8 && event_number == 0)
        shader_reset()
}

function panicbg_inita() //gml_Script_panicbg_inita
{
    var arr = ["Backgrounds_1", "Backgrounds_Ground1", "Backgrounds_still1"]
    for (var i = 0; i < array_length(arr); i++)
    {
        var _id = layer_get_id(arr[i])
        if (_id != -1)
        {
            layer_script_begin(_id, gml_Script_panicbg_starte)
            layer_script_end(_id, gml_Script_panicbg_ende)
        }
    }
    return;
}

