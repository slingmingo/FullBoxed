function scr_transformationcheck() //gml_Script_scr_transformationcheck
{
    for (var i = 0; i < array_length(transformation); i++)
    {
        if (state == transformation[i])
            return 0;
    }
    return 1;
}

