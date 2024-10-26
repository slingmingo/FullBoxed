var i = obj_treasureeffect
while room_exists(i)
{
    global.roomlist[i] = room_get_name(i)
    i++
}
function sh_toggle_collisions(argument0) //gml_Script_sh_toggle_collisions
{
    var arg1 = argument0[1]
    switch arg1
    {
        case "true":
        case "1":
            arg1 = true
            break
        case "false":
        case "0":
            arg1 = false
            break
        default:
            arg1 = (!global.showcollisions)
            break
    }

    global.showcollisions = arg1
    toggle_collision_function()
}

function meta_toggle_collisions() //gml_Script_meta_toggle_collisions
{
    return 
    {
        description: "toggles collision object visibility",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles visibility"]
    };
}

function toggle_collision_function() //gml_Script_toggle_collision_function
{
    if (!variable_global_exists("showcollisionarray"))
    {
        var i = obj_treasureeffect
        global.showcollisionarray[i++] = 778
        global.showcollisionarray[i++] = 776
        global.showcollisionarray[i++] = 311
        global.showcollisionarray[i++] = 393
        global.showcollisionarray[i++] = 278
        global.showcollisionarray[i++] = 141
        global.showcollisionarray[i++] = 260
        global.showcollisionarray[i++] = 652
        global.showcollisionarray[i++] = 561
        global.showcollisionarray[i++] = 349
        global.showcollisionarray[i++] = 272
        global.showcollisionarray[i++] = 758
        global.showcollisionarray[i++] = 449
        global.showcollisionarray[i++] = 290
        global.showcollisionarray[i++] = 55
        global.showcollisionarray[i++] = 116
    }
    var array = global.showcollisionarray
    var length = array_length(array)
    for (i = length - 1; i >= obj_treasureeffect; i--)
    {
        with (array[i])
        {
            if (object_index == array[i])
                visible = (global.showcollisions || room == custom_lvl_room)
        }
    }
    layer_set_visible("Tiles_Solid", global.showcollisions)
}

function sh_toggle_hitboxes(argument0) //gml_Script_sh_toggle_hitboxes
{
    var arg1 = argument0[1]
    switch arg1
    {
        case "true":
        case "1":
            arg1 = true
            break
        case "false":
        case "0":
            arg1 = false
            break
        default:
            arg1 = (!global.showhitboxes)
            break
    }

    global.showhitboxes = arg1
    toggle_hitboxes_function()
}

function meta_toggle_hitboxes() //gml_Script_meta_toggle_hitboxes
{
    return 
    {
        description: "toggles hitbox object visibility",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles visibility for hitboxes"]
    };
}

function toggle_hitboxes_function() //gml_Script_toggle_hitboxes_function
{
    if (!variable_global_exists("showcollisionarray"))
    {
        var i = obj_treasureeffect
        global.showhitboxesarray[i++] = 716
        global.showhitboxesarray[i++] = 301
        global.showhitboxesarray[i++] = 594
        global.showhitboxesarray[i++] = 61
        global.showhitboxesarray[i++] = 71
        global.showhitboxesarray[i++] = 613
        global.showhitboxesarray[i++] = 200
        global.showhitboxesarray[i++] = 801
        global.showhitboxesarray[i++] = 26
        global.showhitboxesarray[i++] = 313
        global.showhitboxesarray[i++] = 262
        global.showhitboxesarray[i++] = 118
        global.showhitboxesarray[i++] = 360
        global.showhitboxesarray[i++] = 325
        global.showhitboxesarray[i++] = 271
        global.showhitboxesarray[i++] = 109
        global.showhitboxesarray[i++] = 351
        global.showhitboxesarray[i++] = 253
        global.showhitboxesarray[i++] = 381
        global.showhitboxesarray[i++] = 748
        global.showhitboxesarray[i++] = 133
        global.showhitboxesarray[i++] = 279
        global.showhitboxesarray[i++] = 72
    }
    var array = global.showhitboxesarray
    var length = array_length(array)
    for (i = length - 1; i >= obj_treasureeffect; i--)
    {
        with (array[i])
        {
            if (object_index == array[i])
                visible = global.showhitboxes
        }
    }
}

function sh_room(argument0) //gml_Script_sh_room
{
    var arg1 = asset_get_index(argument0[1])
    var arg2 = argument0[2]
    if (asset_get_type(argument0[1]) != 3)
        return ("Can't find room " + string(argument0[1]));
    if (asset_get_type(argument0[1]) == 3)
    {
        obj_player1.targetRoom = arg1
        obj_player2.targetRoom = arg1
        obj_player1.targetDoor = arg2
        obj_player2.targetDoor = arg2
        instance_create(0, 0, obj_fadeout)
    }
}

function meta_room() //gml_Script_meta_room
{
    return 
    {
        description: "allows you to go to another room",
        arguments: ["<room>", "<door>"],
        suggestions: [global.roomlist, ["N/A", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "start"]],
        argumentDescriptions: ["sets targetRoom", "sets targetDoor"]
    };
}

function sh_noclip(argument0) //gml_Script_sh_noclip
{
    obj_player1.state = states.debugstate
}

function meta_noclip() //gml_Script_meta_noclip
{
    return 
    {
        description: "toggles noclip state",
        arguments: [""],
        suggestions: [[""]],
        argumentDescriptions: ["toggles whether or not to enable noclip"]
    };
}

function sh_blackbelt(argument0) //gml_Script_sh_blackbelt
{
    var arg1 = argument0[1]
    switch arg1
    {
        case "true":
        case "1":
            arg1 = 1
            break
        case "false":
        case "0":
            arg1 = 0
            break
        default:
            arg1 = 0
            break
    }

    obj_player1.blackbelt = arg1
}

function meta_blackbelt() //gml_Script_meta_blackbelt
{
    return 
    {
        description: "toggles kung-fu",
        arguments: [""],
        suggestions: [[""]],
        argumentDescriptions: ["toggles whether or not you have kung-fu"]
    };
}

function sh_panic(argument0) //gml_Script_sh_panic
{
    var arg1 = argument0[1]
    switch arg1
    {
        case "true":
        case "1":
            arg1 = true
            break
        case "false":
        case "0":
            arg1 = false
            break
        default:
            arg1 = 0
            break
    }

    global.panic = real(arg1)
}

function meta_panic() //gml_Script_meta_panic
{
    return 
    {
        description: "toggles pizza time",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles whether or not to enable pizza time"]
    };
}

function sh_reset_room(argument0) //gml_Script_sh_reset_room
{
    room_restart()
}

function meta_reset_room() //gml_Script_meta_reset_room
{
    return 
    {
        description: "resets room",
        arguments: [""],
        suggestions: [[""]],
        argumentDescriptions: [""]
    };
}

function sh_setvar(argument0) //gml_Script_sh_setvar
{
    var _object = argument0[1]
    var _varname = argument0[2]
    var _varval = argument0[3]
    var _vartype = argument0[4]
    var _arrayindex = argument0[5]
    if (_arrayindex == undefined)
        _arrayindex = "-1"
    if (object_exists(asset_get_index(_object)) || _object == "global")
    {
        var value = _varval
        switch _vartype
        {
            case "asset":
                value = asset_get_index(value)
                break
            case "string":
            case "":
                break
            case "real":
            case "bool":
                value = self.get_bool(value)
                value = real(value)
                break
        }

        if (_arrayindex != "-1")
        {
            var myvar = (_object == "global" ? variable_global_get(_varname) : variable_instance_get(asset_get_index(_object), _varname))
            myvar[_arrayindex] = value
            variable_global_set(_varname, myvar[_arrayindex])
        }
        else
            variable_global_set(_varname, value)
    }
}

function meta_setvar() //gml_Script_meta_setvar
{
    return 
    {
        description: "Sets a global/object variable",
        arguments: ["object", "variable", "value", "type"],
        suggestions: [function() //gml_Script_anon____struct___7_meta_setvar_gml_GlobalScript_scr_rtshellcommands_8067____struct___7_meta_setvar_gml_GlobalScript_scr_rtshellcommands
        {
            var _objs = ["global"]
            for (var i = obj_treasureeffect; i < instance_count; i++)
            {
                with (instance_id[i])
                    array_push(_objs, object_get_name(object_index))
            }
            return _objs;
        }, [], ["0", "1", "true", "false"], ["string", "real", "bool", "asset"], ["-1"]],
        argumentDescriptions: ["Name of the object or \"global\"", "Name of the variable", "Value to set the variable to", "The type of the value."]
    };
}

function sh_create(argument0) //gml_Script_sh_create
{
    instance_create(real(argument0[2]), real(argument0[3]), asset_get_index(argument0[1]))
}

function meta_create() //gml_Script_meta_create
{
    return 
    {
        description: "Creates an object at the specified position",
        arguments: [],
        suggestions: [function() //gml_Script_anon____struct___8_meta_create_gml_GlobalScript_scr_rtshellcommands_8844____struct___8_meta_create_gml_GlobalScript_scr_rtshellcommands
        {
            var _objects = []
            var i = obj_treasureeffect
            while object_exists(i)
            {
                array_push(_objects, object_get_name(i))
                i++
            }
            return _objects;
        }, [(0 << 0)], [(1 << 0)]],
        argumentDescriptions: ["The object", "The X position", "The Y position"]
    };
}

