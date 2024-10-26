with (obj_player)
{
    if (state == states.normal || state == state == 100)
    {
        if key_up2
        {
            instance_create_depth(x, y, 0, obj_genericpoofeffect)
            scr_soundeffect(sfx_enemyprojectile)
            obj_player1.idle = 150
            if (character == "P")
            {
                if (global.peppal < 15)
                    global.peppal += 1
                else
                    global.peppal = 1
                paletteselect = global.peppal
                ini_open("saveData.ini")
                ini_write_real("Palettes", "peppinopal", paletteselect)
                ini_close()
            }
            if (character == "N")
            {
                if (global.noisepal < 10)
                    global.noisepal += 1
                else
                    global.noisepal = 1
                paletteselect = global.noisepal
                ini_open("saveData.ini")
                ini_write_real("Palettes", "noisepal", paletteselect)
                ini_close()
            }
            if (character == "V")
            {
                if (paletteselect < 10)
                    paletteselect += 1
                else
                    paletteselect = 1
            }
            if (character == "M")
            {
                if (paletteselect < 10)
                    paletteselect += 1
                else
                    paletteselect = 1
            }
        }
        if key_down2
        {
            instance_create_depth(x, y, 0, obj_genericpoofeffect)
            scr_soundeffect(sfx_enemyprojectile)
            obj_player1.idle = 150
            if (character == "P")
            {
                if (paletteselect > 1)
                    paletteselect -= 1
                else
                    paletteselect = 15
            }
            if (character == "N")
            {
                if (paletteselect > 1)
                    paletteselect -= 1
                else
                    paletteselect = 10
            }
            if (character == "V")
            {
                if (paletteselect > 1)
                    paletteselect -= 1
                else
                    paletteselect = 10
            }
            if (character == "M")
            {
                if (paletteselect > 1)
                    paletteselect -= 1
                else
                    paletteselect = 10
            }
        }
    }
}
