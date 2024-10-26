function scr_player_iceblock() //gml_Script_scr_player_iceblock
{
    hsp = movespeed * icedir
    image_speed = 0.4
    if (sprite_index == spr_player_iceblockmash && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_iceblock
    if place_meeting((x + hsp), (y - 16), obj_solid)
    {
        icedir *= -1
        scr_soundeffect(sfx_bumpwall)
        instance_create((x + 32 * (-icedir)), y, obj_bumpeffect)
        if (movespeed > 6)
            movespeed -= 0.5
    }
    if key_jump
    {
        icemash++
        image_index = 0
        sprite_index = spr_player_iceblockmash
    }
    if (icemash == 10)
    {
        state = states.mach2
        vsp = -8
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
        flash = 1
        repeat (6)
            create_debris(x, y, spr_icecubedebris, false)
        icemash = 0
    }
}

