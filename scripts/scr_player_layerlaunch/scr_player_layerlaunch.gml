function scr_player_layerlaunch() //gml_Script_scr_player_layerlaunch
{
    if (grounded && vsp > 0 && sprite_index != spr_rockethitwall)
    {
        state = states.normal
        landAnim = 1
        movespeed = 0
    }
    if (sprite_index != spr_rockethitwall && vsp > 0 && inbg == 1)
        instance_activate_object(obj_bgsolid)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpstart)
        sprite_index = spr_player_Sjump
    if (sprite_index == spr_rockethitwall)
    {
        camera_zoom(0.5, 1)
        if (grounded && vsp > 0)
        {
            scr_soundeffect(sfx_groundpound)
            state = states.bossintro
            sprite_index = spr_slipbanan2
            landAnim = 1
            movespeed = 0
            bosscutscene = 1
            bosszoomout = 0.5
        }
    }
}

