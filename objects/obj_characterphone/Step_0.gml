scr_getinput()
if held
{
    with (obj_player)
        x = lerp(x, (other.x + 32), 0.2)
    hudx = lerp(hudx, -100, 0.2)
    if key_right2
    {
        selected++
        namefade = 0
        scr_soundeffect(sfx_step)
    }
    if key_left2
    {
        selected--
        namefade = 0
        scr_soundeffect(sfx_step)
    }
    if (namefade < 1)
        namefade += 0.05
    if (selected == 4)
        selected = 0
    if (selected == -1)
        selected = 3
    if (key_jump && (!instance_exists(obj_fallingcharacter)))
    {
        switch selected
        {
            case 0:
                if (obj_player.character != "P")
                {
                    selectedchar = "P"
                    scr_soundeffect(sfx_collectpizza)
                    with (instance_create((x + 32), (y - 540), obj_fallingcharacter))
                    {
                        selectedchar = other.selectedchar
                        currentchar = obj_player.character
                        currentpalette = 652
                        palselect = global.peppal
                        sprite_index = spr_player_bodyslamfall
                    }
                }
                else
                {
                    held = 0
                    scr_soundeffect(sfx_collectpizza)
                    obj_player.state = states.normal
                    sprite_index = spr_phone
                }
                break
            case 1:
                if (obj_player.character != "N")
                {
                    selectedchar = "N"
                    scr_soundeffect(sfx_collectpizza)
                    with (instance_create((x + 32), (y - 540), obj_fallingcharacter))
                    {
                        selectedchar = other.selectedchar
                        currentchar = obj_player.character
                        currentpalette = 1319
                        palselect = global.noisepal
                        sprite_index = spr_player_bodyslamfall
                    }
                }
                else
                {
                    held = 0
                    scr_soundeffect(sfx_collectpizza)
                    obj_player.state = states.normal
                    sprite_index = spr_phone
                }
                break
            case 2:
                break
        }

    }
}
else
    hudx = lerp(hudx, -500, 0.2)
switch selected
{
    case 0:
        charactername = 2904
        pepx = lerp(pepx, 350, 0.2)
        pepy = lerp(pepy, 200, 0.2)
        noisex = lerp(noisex, 250, 0.2)
        noisey = lerp(noisey, 300, 0.2)
        vigix = lerp(vigix, 350, 0.2)
        vigiy = lerp(vigiy, 400, 0.2)
        pepperx = lerp(pepperx, 450, 0.2)
        peppery = lerp(peppery, 300, 0.2)
        break
    case 1:
        charactername = 2950
        pepx = lerp(pepx, 250, 0.2)
        pepy = lerp(pepy, 300, 0.2)
        noisex = lerp(noisex, 350, 0.2)
        noisey = lerp(noisey, 400, 0.2)
        vigix = lerp(vigix, 450, 0.2)
        vigiy = lerp(vigiy, 300, 0.2)
        pepperx = lerp(pepperx, 350, 0.2)
        peppery = lerp(peppery, 200, 0.2)
        break
    case 2:
        charactername = 1327
        pepx = lerp(pepx, 350, 0.2)
        pepy = lerp(pepy, 400, 0.2)
        noisex = lerp(noisex, 450, 0.2)
        noisey = lerp(noisey, 300, 0.2)
        vigix = lerp(vigix, 350, 0.2)
        vigiy = lerp(vigiy, 200, 0.2)
        pepperx = lerp(pepperx, 250, 0.2)
        peppery = lerp(peppery, 300, 0.2)
        break
    case 3:
        charactername = 1327
        pepx = lerp(pepx, 450, 0.2)
        pepy = lerp(pepy, 300, 0.2)
        noisex = lerp(noisex, 350, 0.2)
        noisey = lerp(noisey, 200, 0.2)
        vigix = lerp(vigix, 250, 0.2)
        vigiy = lerp(vigiy, 300, 0.2)
        pepperx = lerp(pepperx, 350, 0.2)
        peppery = lerp(peppery, 400, 0.2)
        break
}

