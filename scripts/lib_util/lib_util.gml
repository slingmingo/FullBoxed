function Approach(argument0, argument1, argument2) //gml_Script_Approach
{
    if (argument0 < argument1)
    {
        argument0 += argument2
        if (argument0 > argument1)
            return argument1;
    }
    else
    {
        argument0 -= argument2
        if (argument0 < argument1)
            return argument1;
    }
    return argument0;
}

function randsign(argument0) //gml_Script_randsign
{
    return choose(argument0, (-argument0));
}

