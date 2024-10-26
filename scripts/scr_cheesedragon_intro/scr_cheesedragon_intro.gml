function scr_cheesedragon_intro() //gml_Script_scr_cheesedragon_intro
{
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesedragon_intro2)
            image_speed = 0
    }
    if (floor(image_index) == 5 && sprite_index == spr_cheesedragon_intro2 && (!audio_is_playing(sfx_dragonscream)))
        scr_soundeffect(sfx_dragonscream)
    if (sprite_index == spr_cheesedragon_goingup && wait > 0)
        wait--
    if (sprite_index == spr_cheesedragon_intro2 && floor(image_index) == (image_number - 1))
    {
        wait = 20
        sprite_index = spr_cheesedragon_goingup
        vsp = -3
        image_speed = 0.4
    }
    if (wait == 0 && sprite_index == spr_cheesedragon_goingup)
    {
        state = "idle"
        sprite_index = spr_cheesedragon_idle
        vsp = 0
    }
}

