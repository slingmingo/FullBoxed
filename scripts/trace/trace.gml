function trace() //gml_Script_trace
{
    var r = string(argument[0])
    for (var i = 1; i < argument_count; i++)
        r += (" " + string(argument[i]))
    show_debug_message(r)
}

