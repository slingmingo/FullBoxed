if falling
{
    y += 16
    switch selectedchar
    {
        case "P":
            sprite_index = spr_player_bodyslamfall
            break
        case "N":
            sprite_index = spr_playerN_bodyslam
            break
    }

}
else if (vsp < 20)
    vsp += 0.5
y += vsp
if (y >= obj_characterphone.y && falling)
{
    falling = 0
    switch currentchar
    {
        case "P":
            sprite_index = spr_player_deathend
            currentpalette = 652
            break
        case "N":
            sprite_index = spr_playerN_deathend
            currentpalette = 1319
            break
    }

    sprite_index = obj_player.spr_dead
    palselect = obj_player.paletteselect
    vsp = -12
    scr_soundeffect(sfx_groundpound)
    obj_characterphone.sprite_index = spr_phone
    with (obj_player)
    {
        instance_create(x, y, obj_playerexplosion)
        character = other.selectedchar
        state = states.freefallland
        obj_characterphone.held = 0
        scr_characterspr()
        sprite_index = spr_bodyslamland
        if (character == "P")
            paletteselect = global.peppal
        if (character == "N")
            paletteselect = global.noisepal
    }
}
