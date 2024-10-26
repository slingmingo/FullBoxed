function lang(argument0, argument1) //gml_Script_lang
{
    if (argument1 == undefined)
        argument1 = -4
    var value = variable_struct_get(global.languagejson, argument0)
    if is_array(value)
        return value[argument1];
    return value;
}

