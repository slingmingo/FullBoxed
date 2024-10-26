var t;
function scr_editor_init_buttons() //gml_Script_scr_editor_init_buttons
{
    with (instance_create_depth(0, 0, -100, obj_button))
    {
        sprite_index = spr_bigbutton
        spr_icon = spr_space2var
        function scr_editor_init_buttons_scr_editor_init_buttons_gml_GlobalScript_scr_editor_init_buttons() //gml_Script_scr_editor_init_buttons_scr_editor_init_buttons_gml_GlobalScript_scr_editor_init_buttons
        {
            var a = [["SAVE", -4, -4], ["LOAD LEVEL", -4, -4], ["EXIT EDITOR", -4, -4]]
            create_buttons_array(0, 64, 32, 24, a)
            return;
        }

        scr_editor_init_buttons = method(-1, gml_Script_scr_editor_init_buttons_scr_editor_init_buttons_gml_GlobalScript_scr_editor_init_buttons)
    }
    with (instance_create_depth(64, 0, -100, obj_button))
    {
        sprite_index = spr_bigbutton
        spr_icon = spr_mrstick_tauntanim
    }
    with (instance_create_depth(128, 0, -100, obj_button))
    {
        sprite_index = spr_bigbutton
        spr_icon = spr_ancho_scared
        selectedid = 0
        scr_editor_init_buttons = method(-1, gml_Script_scr_editor_init_buttons_scr_editor_init_buttons_gml_GlobalScript_scr_editor_init_buttons)
        scr_editor_init_buttons = method(-1, gml_Script_scr_editor_init_buttons_scr_editor_init_buttons_gml_GlobalScript_scr_editor_init_buttons)
    }
    return;
}

