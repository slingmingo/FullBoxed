with (obj_player1)
{
    if key_up2
    {
        instance_create_depth(x, y, 0, obj_genericpoofeffect)
        audio_play_sound(sfx_enemyprojectile, 1, false)
        if (character == "P")
        {
            scr_characterspr()
            character = "N"
            y -= 2
            ispeppino = 0
            image_index = 0
        }
        else
        {
            scr_characterspr()
            character = "P"
            y -= 2
            ispeppino = 1
            image_index = 1
        }
    }
}
