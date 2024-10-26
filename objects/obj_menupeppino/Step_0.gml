bgscroll += 0.2
if (height > 0)
    height += grav
if (height < 0)
    height = 0
if (!instance_exists(obj_credits))
{
    if (move == 1)
    {
        menpepx = lerp(menpepx, 200, 0.1)
        draw_sprite_ext(spr_title, 0, 30, 30, 1, 1, 0, c_white, fade)
        if (fade < 1)
            fade += 0.1
        if ((!instance_exists(obj_option)) && obj_gamestarter.ispressed == false)
        {
            if (obj_player.key_down2 && selected != 3)
            {
                selected++
                scr_soundeffect(sfx_step)
            }
            if (obj_player.key_up2 && selected != 0)
            {
                scr_soundeffect(sfx_step)
                selected--
            }
            if obj_player.key_jump
            {
                switch selected
                {
                    case 1:
                        scr_soundeffect(sfx_enemyprojectile)
                        instance_create(0, 0, obj_option)
                        break
                    case 2:
                        obj_player.key_jump2 = 0
                        obj_player.key_jump = 0
                        instance_create(0, 0, obj_credits)
                        break
                    case 3:
                        scr_soundeffect(sfx_enemyprojectile)
                        game_end()
                        break
                }

            }
        }
        if (floor(image_index) == (image_number - 1))
        {
            if (sprite_index == spr_titlepep_leftoforward)
                sprite_index = spr_titlepep_forward
            if (sprite_index == spr_titlepep_forwardtoleft || sprite_index == spr_titlepep_righttoleft)
                sprite_index = spr_titlepep_left
            if (sprite_index == spr_titlepep_middletoright)
                sprite_index = spr_titlepep_right
        }
        if (selected == 0 && sprite_index == spr_titlepep_left)
        {
            image_index = 0
            sprite_index = spr_titlepep_leftoforward
        }
        if (selected == 1 && sprite_index == spr_titlepep_forward)
        {
            image_index = 0
            sprite_index = spr_titlepep_forwardtoleft
        }
        if (selected == 2 && sprite_index == spr_titlepep_left)
        {
            image_index = 0
            sprite_index = spr_titlepep_middletoright
        }
        if (selected == 1 && sprite_index == spr_titlepep_right)
        {
            image_index = 0
            sprite_index = spr_titlepep_righttoleft
        }
        cursorindex += 0.5
    }
    if (instance_exists(obj_gamestarter) && obj_gamestarter.canstart == 0)
        jumpscarecount++
    if (jumpscarecount >= 1200 && jumpscaring == 0)
    {
        jumpscaring = 1
        scr_soundeffect(sfx_scream7)
        scr_soundeffect(sfx_scream7)
    }
    if (jumpscaring == 1)
        scarescale += 0.1
    if (scarescale >= 4)
        game_end()
}
squash = lerp(squash, 1, 0.3)
