if active
{
    with (obj_player)
    {
        state = states.actor
        hsp = 0
        vsp = 0
        visible = false
    }
}
if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_pizzaportal_appear:
            sprite_index = spr_pizzaportalexit
            scr_soundeffect(sfx_lapenter)
            if (character == "D" && global.laps >= 2)
            {
                scr_soundeffect(sfx_lappinglaugh)
                instance_create_depth(0, 0, 300, Object805)
                instance_create_depth(0, 0, 200, obj_pillarflash)
            }
            break
        case spr_pizzaportalexit:
            sprite_index = spr_pizzaportal_disappear
            with (obj_player)
            {
                state = states.normal
                visible = true
                scr_soundeffect(sfx_lapjingle)
            }
            active = 0
            break
        case spr_pizzaportal_disappear:
            instance_destroy()
            break
    }

}
