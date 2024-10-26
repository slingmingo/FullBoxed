global.sfmt_buf = buffer_create(1024, buffer_grow, 1)
global.sfmt_map = ds_map_create()
global.sfmt_warn = ds_map_create()
function sfmt() //gml_Script_sfmt
{
    var f = argument[0]
    var w = ds_map_find_value(global.sfmt_map, f)
    if (w == undefined)
    {
        w[0] = ""
        ds_map_set(global.sfmt_map, f, w)
        var i = string_pos("%", f)
        var n = 0
        while i
        {
            w[n++] = string_copy(f, 1, (i - 1))
            f = string_delete(f, 1, i)
            i = string_pos("%", f)
        }
        w[n++] = f
    }
    else
        n = array_length(w)
    var b = global.sfmt_buf
    buffer_seek(b, buffer_seek_start, 0)
    buffer_write(b, buffer_text, w[0])
    var m = argument_count
    for (i = 1; i < n; i++)
    {
        if (i < m)
        {
            f = string(argument[i])
            if (f != "")
                buffer_write(b, buffer_text, f)
        }
        f = w[i]
        if (f != "")
            buffer_write(b, buffer_text, f)
    }
    buffer_write(b, buffer_u8, 0)
    buffer_seek(b, buffer_seek_start, 0)
    return buffer_read(b, buffer_string);
}

