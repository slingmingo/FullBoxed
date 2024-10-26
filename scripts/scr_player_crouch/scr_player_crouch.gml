function scr_player_crouch() //gml_Script_scr_player_crouch
{
    move = key_left + key_right
    if (character == "M")
    {
        state = states.normal
        sprite_index = spr_pepperman_idle
    }
    switch character
    {
        case "P":
        case "N":
        case "D":
        case "NE":
        case "V":
            if (!(place_meeting(x, (y + 1), obj_railparent)))
                hsp = move * movespeed
            else
            {
                var _railinst = instance_place(x, (y + 1), obj_railparent)
                hsp = move * movespeed + _railinst.movespeed * _railinst.dir
            }
            movespeed = 4
            mask_index = spr_crouchmask
            turning = 0
            if ((!grounded) && (!key_jump))
            {
                jumpAnim = 0
                state = states.crouchjump
                movespeed = 4
                crouchAnim = 1
                image_index = 0
            }
            if (grounded && (!key_down) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && (!key_jump))
            {
                state = states.normal
                movespeed = 0
                crouchAnim = 1
                jumpAnim = 1
                image_index = 0
                mask_index = spr_player_mask
            }
            if (crouchAnim == 0)
            {
                if (move == 0)
                {
                    if (shotgunAnim == 0)
                        sprite_index = spr_crouch
                    else
                        sprite_index = spr_shotgunduck
                }
                if (move != 0)
                {
                    if (shotgunAnim == 0)
                        sprite_index = spr_crawl
                    else
                        sprite_index = spr_shotguncrawl
                }
            }
            if (crouchAnim == 1)
            {
                if (move == 0)
                {
                    if (shotgunAnim == 0)
                        sprite_index = spr_couchstart
                    else
                        sprite_index = spr_shotgungoduck
                    if (floor(image_index) == (image_number - 1))
                        crouchAnim = 0
                }
            }
            if (move != 0)
            {
                xscale = move
                crouchAnim = 0
            }
            if (key_jump && grounded && (!inbackground) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
            {
                if (character == "P")
                    scr_soundeffect(sfx_jump)
                else
                    scr_soundeffect(sfx_jumpN)
                vsp = -8
                state = states.crouchjump
                movespeed = 4
                image_index = 0
                crouchAnim = 1
                jumpAnim = 1
            }
            image_speed = 0.45
            break
    }

    return;
}

