shader_set(global.Pal_Shader)
if ((!instance_exists(obj_deathfadeout)) && room != rank_room)
{
    var hep = 0
    var imindex = 0
    while (hep < 6)
    {
        var _x = 0
        var _y = 0
        var col = c_white
        var zpad = imindex * 3
        pal_swap_set(playerpal, obj_player.paletteselect, 0)
        repeat (6)
        {
            if (imindex == 0 && playerhp < 6 && hep >= playerhp)
                col = c_black
            if (imindex == 0 || hep < playerhp)
            {
                var xf = 32 + _x * 45 - zpad
                var yf = 32 + _y * 40 - zpad
                draw_sprite_ext(playerhpicon, run_index, xf, yf, 1, 1, 0, col, image_alpha)
            }
            _x++
            if (_x >= 3)
            {
                _x = 0
                _y++
            }
            hep += 1
        }
        imindex += 1
    }
    shader_reset()
    var bhep = 0
    imindex = 0
    while (bhep < 10)
    {
        _x = 0
        _y = 0
        var bcol = c_white
        zpad = imindex * 5
        repeat (10)
        {
            if (imindex == 0 && bosshp < 10 && bhep >= bosshp)
                bcol = c_black
            if (imindex == 0 || bhep < bosshp)
            {
                xf = 675 + _x * 61 - zpad
                yf = 35 + _y * 52 - zpad
                draw_sprite_ext(bosshpicon, run_index, xf, yf, 1, 1, 0, bcol, image_alpha)
            }
            _x++
            if (_x >= 5)
            {
                _x = 0
                _y++
            }
            bhep += 1
        }
        imindex += 1
    }
}
