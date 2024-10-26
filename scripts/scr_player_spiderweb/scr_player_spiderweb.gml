function scr_player_spiderweb() //gml_Script_scr_player_spiderweb
{
    hsp = 0
    vsp = 0
    movespeed = 0
    move = key_left + key_right
    sprite_index = spr_fall
    image_speed = 0.35
    if (move != 0)
        xscale = move
    if instance_exists(webID)
    {
        x = lerp(x, webID.x, 0.2)
        y = lerp(y, webID.y, 0.2)
    }
    if key_jump
    {
        state = states.jump
        vsp = -11
        sprite_index = spr_jump
        instance_destroy(webID)
        image_index = 0
        scr_soundeffect(sfx_jump)
    }
    return;
}

