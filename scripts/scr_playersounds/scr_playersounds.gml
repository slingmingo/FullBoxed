function scr_playersounds() //gml_Script_scr_playersounds
{
    with (obj_player)
    {
        if ((!audio_is_playing(sfx_mach1)) && grounded && (!audio_is_playing(sfx_mach2N)) && (!audio_is_playing(sfx_mach1V)) && sprite_index == spr_mach1)
        {
            if (character == "N")
            {
                mach1snd = audio_play_sound(sfx_mach2N, 1, false)
                sfx_gain(mach1snd)
            }
            else if (character == "V")
            {
                mach1snd = audio_play_sound(sfx_mach1, 1, false)
                sfx_gain(mach1snd)
            }
            else if (character == "P")
            {
                mach1snd = audio_play_sound(sfx_mach1, 1, false)
                sfx_gain(mach1snd)
            }
        }
        else if (state != states.mach2 || (!grounded) || move == (-xscale))
            audio_stop_sound(mach1snd)
        if (sprite_index == spr_mach)
            audio_stop_sound(mach1snd)
        if ((sprite_index == spr_mach || state == states.climbwall) && (!audio_is_playing(sfx_mach2)) && (!audio_is_playing(sfx_mach2N)) && (!audio_is_playing(sfx_mach2N)) && (!audio_is_playing(sfx_mach2V)))
        {
            if (character == "N")
            {
                mach2snd = audio_play_sound(sfx_mach2N, 1, false)
                sfx_gain(mach2snd)
            }
            else if (character == "V")
            {
                mach2snd = audio_play_sound(sfx_mach2, 1, false)
                sfx_gain(mach2snd)
            }
            else if (character == "P")
            {
                mach2snd = audio_play_sound(sfx_mach2, 1, false)
                sfx_gain(mach2snd)
            }
            else if (character == "S")
            {
                mach2snd = audio_play_sound(sfx_mach2N, 1, false)
                sfx_gain(mach2snd)
            }
        }
        else if (sprite_index != spr_mach && state != states.climbwall)
            audio_stop_sound(mach2snd)
        if (state == states.rocket && (!audio_is_playing(sfx_mach4)))
        {
            rocketsnd = audio_play_sound(sfx_mach4, 1, false)
            sfx_gain(rocketsnd)
        }
        else if (state != states.rocket)
            audio_stop_sound(rocketsnd)
        if ((state == states.mach3 || sprite_index == spr_mach3boost) && sprite_index != spr_crazyrun && (!audio_is_playing(sfx_mach3)) && (!audio_is_playing(sfx_mach3N)) && (!audio_is_playing(sfx_mach3N)) && (!audio_is_playing(sfx_mach3V)))
        {
            if (character == "N")
            {
                mach3snd = audio_play_sound(sfx_mach3N, 1, false)
                sfx_gain(mach3snd)
            }
            else if (character == "V")
            {
                mach3snd = audio_play_sound(sfx_mach3, 1, false)
                sfx_gain(mach3snd)
            }
            else if (character == "P")
            {
                mach3snd = audio_play_sound(sfx_mach3, 1, false)
                sfx_gain(mach3snd)
            }
            else if (character == "S")
            {
                mach3snd = audio_play_sound(sfx_mach3N, 1, false)
                sfx_gain(mach3snd)
            }
        }
        else if ((state != states.mach3 && sprite_index != spr_mach3boost) || sprite_index == spr_crazyrun)
            audio_stop_sound(mach3snd)
        if (state == states.knightpepslopes && grounded && (!audio_is_playing(sfx_knightslide)))
        {
            knightslide = audio_play_sound(sfx_knightslide, 1, false)
            sfx_gain(knightslide)
        }
        else if ((state != states.knightpepslopes || (!grounded)) && audio_is_playing(sfx_knightslide))
            audio_stop_sound(knightslide)
        if ((sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode) && (!audio_is_playing(sfx_bombpep1)))
        {
            bombpep1snd = audio_play_sound(sfx_bombpep1, 1, false)
            sfx_gain(bombpep1snd)
        }
        else if (sprite_index != spr_bombpeprun && sprite_index != spr_bombpeprunabouttoexplode && audio_is_playing(sfx_bombpep1))
            audio_stop_sound(bombpep1snd)
        if (sprite_index == spr_crazyrun && (!audio_is_playing(sfx_mach4)) && (!audio_is_playing(sfx_crazyrunN)))
        {
            if (character == "P")
                mach4snd = audio_play_sound(sfx_mach4, 1, false)
            else if (character == "N")
                mach4snd = audio_play_sound(sfx_crazyrunN, 1, false)
            sfx_gain(mach4snd)
        }
        else if (sprite_index != spr_crazyrun)
            audio_stop_sound(mach4snd)
        if (state != states.Sjumpprep && audio_is_playing(superjumpprepsnd))
            audio_stop_sound(superjumpprepsnd)
        if (state != states.Sjumpprep && audio_is_playing(superjumpholdsnd))
            audio_stop_sound(superjumpholdsnd)
        if (sprite_index == spr_tumblestart && (!audio_is_playing(sfx_tumble1)) && floor(image_index) < 11 && character != "N" && (!grounded))
            tumble1snd = audio_play_sound(sfx_tumble1, 1, false)
        sfx_gain(tumble1snd)
        if (sprite_index == spr_tumblestart && floor(image_index) == 11 && (!audio_is_playing(sfx_tumble2)))
        {
            tumble2snd = audio_play_sound(sfx_tumble2, 1, false)
            sfx_gain(tumble2snd)
            audio_stop_sound(tumble1snd)
        }
        if ((sprite_index == spr_tumble || sprite_index == spr_machroll) && (!audio_is_playing(sfx_tumble3)))
        {
            tumble3snd = audio_play_sound(sfx_tumble3, 1, false)
            sfx_gain(tumble3snd)
        }
        if (state != states.tumble && sprite_index != spr_machroll)
        {
            audio_stop_sound(tumble1snd)
            audio_stop_sound(tumble2snd)
            audio_stop_sound(tumble3snd)
        }
        if (audio_is_playing(suplexdashsnd) && state != states.handstandjump)
            audio_stop_sound(suplexdashsnd)
        if (state == states.firemouth && key_jump && grounded && (!audio_is_playing(sfx_woosh)))
        {
            firemjump = audio_play_sound(sfx_woosh, 1, false)
            sfx_gain(firemjump)
        }
        if (state == states.freefall && (!audio_is_playing(sfx_groundpoundloop)) && sprite_index != spr_bodyslamstart)
        {
            gploop = audio_play_sound(sfx_groundpoundloop, 1, false)
            sfx_gain(gploop)
        }
        else
            audio_stop_sound(sfx_groundpoundloop)
    }
    if (state == states.grind && (!audio_is_playing(sfx_knightslide)))
    {
        grindrail = audio_play_sound(sfx_knightslide, 1, false)
        sfx_gain(grindrail)
    }
    return;
}
