function scr_player_clown() //gml_Script_scr_player_clown
{
    hsp = movespeed * xscale
    if grounded
    {
        if (key_down || scr_solid(x, (y - 16)) || scr_solid(x, (y - 32)))
        {
            mask_index = spr_crouchmask
            image_speed = 0.35
            sprite_index = spr_clowncrouch
        }
        else
        {
            sprite_index = spr_clown
            image_speed = 0.7
            mask_index = spr_player_mask
        }
        wallspeed = 0.6
        if (key_jump || (input_buffer_jump < 8 && vsp > 0))
        {
            image_index = 0
            scr_soundeffect(sfx_jump)
            sprite_index = spr_clownjump
            particle_set_scale(4, xscale, 1)
            create_particle(x, y, 4, 0)
            vsp = -11
            jumpAnim = 1
            jumpstop = 0
            if place_meeting(x, (y + 1), obj_railparent)
                railmomentum = 1
            freefallstart = 0
        }
        if (movespeed < 12)
            movespeed += 0.4
        if (movespeed > 12)
            movespeed = 12
        if (place_meeting((x + 1 * xscale), y, obj_solid) && mask_index == spr_player_mask)
        {
            sprite_index = spr_clownbump
            image_index = 0
            vsp = -6
            movespeed = -6
        }
    }
    else
    {
        if (!jumpstop)
        {
            if ((!key_jump2) && vsp < 0.5 && sprite_index != spr_clownbump)
            {
                vsp /= 15
                jumpstop = 1
            }
        }
        else if (scr_solid(x, (y - 1)) && (!jumpAnim))
        {
            vsp = grav
            jumpstop = 1
        }
        image_speed = 0.4
        if (sprite_index == spr_clownjump && floor(image_index) == (image_number - 1))
        {
            jumpAnim = 0
            sprite_index = spr_clownfall
        }
        if (sprite_index == spr_clownbump && floor(image_index) == (image_number - 1))
            sprite_index = spr_clownfall
        if (place_meeting((x + 1 * xscale), y, obj_solid) && sprite_index != spr_clownbump)
        {
            sprite_index = spr_clownwallclimb
            vsp = (-wallspeed)
            if (key_jump || (input_buffer_jump < 8 && vsp > 0))
            {
                image_index = 0
                scr_soundeffect(sfx_jump)
                sprite_index = spr_clownjump
                vsp = -11
                jumpAnim = 1
                jumpstop = 0
                if place_meeting(x, (y + 1), obj_railparent)
                    railmomentum = 1
                freefallstart = 0
                if (xscale == 1)
                    xscale = -1
                else
                    xscale = 1
                movespeed = 8
            }
            if place_meeting(x, (y - 2), obj_solid)
            {
                sprite_index = spr_clownbump
                vsp = 4
                movespeed = -4
            }
        }
        else if (sprite_index == spr_clownwallclimb)
            sprite_index = spr_clownjump
        if (wallspeed < 12)
            wallspeed += 0.25
    }
    if (sprite_index == spr_clownjump && image_index == (image_number - 1))
        sprite_index = spr_clownfall
    if (sprite_index == spr_clownbump && image_index == (image_number - 1))
        sprite_index = spr_clown
}

