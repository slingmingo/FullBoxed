function scr_panicbg_init() //gml_Script_scr_panicbg_init
{
    var layernum = 0
    for (i = 0; i < 3; i++)
    {
        var layername = "Backgrounds_" + (string(i + 1))
        if layer_exists(layername)
            layers[layernum++] = layername
    }
    if (!layernum)
        return;
    var bottom_id = layer_get_id(layers[0])
    var top_id = layer_get_id(layers[(layernum - 1)])
    layer_script_begin(bottom_id, gml_Script_scr_panicbg_start)
    layer_script_end(top_id, gml_Script_scr_panicbg_end)
}

