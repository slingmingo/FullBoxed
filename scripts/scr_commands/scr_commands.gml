function scr_do_command(argument0) //gml_Script_scr_do_command
{
    with (obj_editor)
    {
        while (undo > 1)
        {
            undo--
            var t = ds_list_size(commandlist) - undo
            ds_list_find_value(commandlist, t).ds_list_find_value(commandlist, t).OnDelete()
            ds_list_delete(commandlist, t)
        }
        argument0.argument0.Do()
        ds_list_add(commandlist, argument0)
    }
    return;
}

function scr_undo_command() //gml_Script_scr_undo_command
{
    if (!ds_list_empty(commandlist))
    {
        var b = ds_list_find_value(commandlist, (ds_list_size(commandlist) - undo))
        if (b.state == states.revolver)
        {
            b.b.Undo()
            b.state = states.normal
        }
        if (undo < ds_list_size(commandlist))
            undo++
    }
    return;
}

function scr_redo_command() //gml_Script_scr_redo_command
{
    if (!ds_list_empty(commandlist))
    {
        b = ds_list_find_value(commandlist, (ds_list_size(commandlist) - undo))
        if (b.state == states.normal)
        {
            b.b.Do()
            b.state = states.revolver
        }
        if (undo > 1)
            undo--
    }
    return;
}

