function approach(argument0, argument1, argument2) //gml_Script_approach
{
    return (argument0 + (clamp((argument1 - argument0), (-abs(argument2)), abs(argument2))));
}

function wrap(argument0, argument1, argument2) //gml_Script_wrap
{
    argument0 = floor(argument0)
    var _min = floor(min(argument1, argument2))
    var _max = floor(max(argument1, argument2))
    var range = _max - _min + 1
    return (((((argument0 - _min) % range) + range) % range) + _min);
}

function chance(argument0) //gml_Script_chance
{
    return argument0 > random(1);
}

function wave(argument0, argument1, argument2, argument3) //gml_Script_wave
{
    var a4 = (argument1 - argument0) * 0.5
    return (argument0 + a4 + (sin((current_time * 0.001 + argument2 * argument3) / argument2 * (2 * pi))) * a4);
}

