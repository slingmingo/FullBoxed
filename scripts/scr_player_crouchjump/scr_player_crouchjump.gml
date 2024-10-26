function scr_player_crouchjump() //gml_Script_scr_player_crouchjump
{
    move = key_left + key_right
    mask_index = spr_crouchmask
    hsp = move * movespeed
    if (move != 0)
        movespeed = 4
    if (key_slap2 && sprite_index != spr_suplexbump && pistolAnim == 0 && (!key_up) && (!key_down) && character != "V" && character != "NE" && character != "D")
    {
        image_index = 0
        sprite_index = spr_suplexdashjumpstart
        flash = 1
        suplexmove = 1
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
        sfx_gain(suplexdashsnd)
        if ((!instance_exists(obj_crazyrunothereffect)) && sprite_index != spr_Sjumpcancelstart)
        {
            with (instance_create((x + 12), y, obj_crazyrunothereffect))
                image_speed = 0.55
        }
        state = states.handstandjump
        if (isswimming == false)
            movespeed = 5
        else if (movespeed < 2)
            movespeed = 2
    }
    if ((!key_jump2) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp = grav
        jumpstop = 1
    }
    if grounded
    {
        state = states.crouch
        jumpAnim = 1
        crouchAnim = 1
        image_index = 0
        jumpstop = 0
        scr_soundeffect(sfx_step)
    }
    if (jumpAnim == 1 && sprite_index != spr_suplexdashjumpstart)
    {
        if (shotgunAnim == 0)
            sprite_index = spr_crouchjump
        else
            sprite_index = spr_crouchjump
        if (floor(image_index) == (image_number - 1))
            jumpAnim = 0
    }
    if (jumpAnim == 0 && sprite_index != spr_suplexdashjumpstart)
    {
        if (shotgunAnim == 0)
            sprite_index = spr_crouchfall
        else
            sprite_index = spr_crouchfall
    }
    if (move != 0)
        xscale = move
    image_speed = 0.35
    return;
}

