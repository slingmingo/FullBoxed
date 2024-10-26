function scr_player_bossintro() //gml_Script_scr_player_bossintro
{
    hsp = 0
    xscale = 1
    hurted = 0
    inv_frames = 0
    if (sprite_index == spr_player_bossintro && floor(image_index) == (image_number - 1))
    {
        state = states.normal
        image_index = 0
    }
    if (sprite_index == spr_player_levelcomplete && floor(image_index) == (image_number - 1))
        image_speed = 0
    else
        image_speed = 0.35
    if (bosscutscene == 1 && sprite_index != spr_slipbanan2)
        bosszoomout += 0.00135
    if (sprite_index == spr_player_givepizza && floor(image_index) == (image_number - 1))
        image_speed = 0
    if (sprite_index == spr_player_levelcomplete && floor(image_index) == (image_number - 1))
        image_speed = 0
    if (sprite_index == spr_slipbanan2 && floor(image_index) == (image_number - 1))
    {
        image_index = 0
        sprite_index = spr_facehurtup
    }
    if (sprite_index == spr_facehurtup && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_facehurt
        loopcutscene = 155
        image_index = 0
        scr_soundeffect(mu_testriser)
    }
    if (sprite_index == spr_facehurt)
    {
        if (loopcutscene > 0)
            loopcutscene--
    }
    if (sprite_index == spr_facehurt && loopcutscene <= 0)
    {
        image_index = 0
        sprite_index = spr_bossintro1
        loopcutscene = 205
    }
    if (sprite_index == spr_slipbanan2 || sprite_index == spr_facehurtup || sprite_index == spr_facehurt || sprite_index == spr_bossintro1)
        camera_zoom(bosszoomout, 1, true)
    if (sprite_index == spr_bossintro1)
    {
        if (loopcutscene > 0)
            loopcutscene--
        if (loopcutscene <= 0)
        {
            image_index = 0
            sprite_index = spr_bossintro2
        }
    }
    if (character == "P")
    {
        if (sprite_index == spr_bossintro2 && (floor(image_index) == 3 || floor(image_index) == 9) && (!audio_is_playing(sfx_stompenemy)))
            scr_soundeffect(sfx_stompenemy)
        if (sprite_index == spr_bossintro2 && floor(image_index) == 18 && (!audio_is_playing(sfx_pepangryscream)))
            scr_soundeffect(sfx_pepangryscream)
    }
    if (character == "N")
    {
        if (sprite_index == spr_bossintro2 && floor(image_index) == 38 && (!instance_exists(obj_playerexplosion)))
            instance_create(x, y, obj_playerexplosion)
        if (sprite_index == spr_bossintro1 && floor(image_index) == (image_number - 1))
            loopcutscene = 0
    }
    if (sprite_index == spr_bossintro2 && floor(image_index) == (image_number - 1))
    {
        state = states.normal
        scr_music(mu_dragonlair)
        bosscutscene = 0
        image_index = 0
    }
    return;
}

