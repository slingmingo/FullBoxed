function scr_player_freefallland() //gml_Script_scr_player_freefallland
{
    mach2 = 0
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    movespeed = 0
    facehurt = 1
    if (climbbuffer > 0)
        climbbuffer--
    pepperwall = 0
    start_running = 1
    if (((key_jump || (input_buffer_jump < 8 && (!key_attack) && vsp > 0)) && (!key_down)) || climbbuffer > 0)
    {
        scr_soundeffect(sfx_jump)
        instance_create_depth(x, (y + 1), 0, obj_groundpoundjumpeffect)
        sprite_index = spr_highjump
        movespeed = tauntstoredmovespeed
        scr_soundeffect(sfx_stompenemy)
        if (character == "M")
            vsp = -19
        else if (hyperpeppino == 0)
            vsp = -16
        else
            vsp = -19
        if (character == "V")
            vsp = -13
        if inbackground
            vsp /= 2
        particle_set_scale(4, xscale, 1)
        create_particle(x, y, 4, 0)
        state = states.jump
        jumpstop = 0
        image_index = 0
        jumpAnim = 1
    }
    alarm[4] = 14
    hsp = 0
    if (character != "M")
    {
        if (!grounded)
        {
            sprite_index = spr_bodyslamfall
            state = states.freefall
            reboundvsp = 0
            if (vsp < 10)
                vsp = 10
        }
        if (floor(image_index) == (image_number - 1) && grounded)
        {
            if (character != "S")
            {
                facehurt = 1
                if (!inbackground)
                    vsp = -6 + (-reboundvsp)
                else
                    vsp = (-6 + (-reboundvsp)) / 2
                sprite_index = spr_machfreefall
                image_index = 0
                state = states.normal
                reboundvsp = 0
                jumpstop = 1
            }
            else
                state = states.normal
        }
    }
    else if (key_down && image_index < 2.5)
    {
        if (peppersjumphold > 0 && sprite_index == spr_pepperman_groundpoundland && image_index < 2)
        {
            image_speed = 0
            peppersjumphold--
        }
        if (peppersjumphold <= 0 && sprite_index == spr_pepperman_groundpoundland)
        {
            image_speed = 0.35
            sprite_index = spr_pepperman_groundpoundhold
        }
    }
    else
    {
        if (floor(image_index) == (image_number - 1) && sprite_index != spr_pepperman_groundpoundhold)
        {
            if ((!grounded) && (!(place_meeting(x, (y - 64), obj_solid))))
            {
                sprite_index = spr_freefall
                peppersjumphold = 20
                state = states.freefall
                reboundvsp = 0
                vsp = 6
            }
            else
            {
                sprite_index = spr_pepperman_idle
                peppersjumphold = 20
                image_index = 0
                state = states.normal
                reboundvsp = 0
                jumpstop = 1
            }
        }
        image_speed = 0.4
    }
    if (sprite_index == spr_pepperman_groundpoundhold && (!key_down))
    {
        peppersjumphold = 20
        audio_stop_sound(sfx_superjumphold)
        scr_soundeffect(sfx_superjumprelease)
        state = states.Sjump
        vsp = -12
        sprite_index = spr_pepperman_rolling
    }
    if (sprite_index == spr_pepperman_groundpoundhold && (!audio_is_playing(sfx_superjumphold)))
        scr_soundeffect(sfx_superjumphold)
    return;
}

