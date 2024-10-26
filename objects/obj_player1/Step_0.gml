if (room == rm_editor)
{
    visible = false
    return;
}
if (room == custom_lvl_room)
{
    cam = -4
    cam_width = 0
    cam_height = 0
    instance_activate_all()
    with (obj_camera)
        bound_camera = 0
}
if (key_down2 && global.swapmode == 1 && state == states.tauntmoves)
{
    cooppal = paletteselect
    scr_soundeffect(sfx_parry)
    instance_create(x, y, obj_genericpoofeffect)
    if (character == "P")
        character = "N"
    else
        character = "P"
    scr_characterspr()
    movespeed = tauntstoredmovespeed
    vsp = tauntstoredvsp
    key_down = 0
    obj_coopplayerfollow.sprite_index = tauntstoredsprite
    state = tauntstoredstate
    paletteselect = obj_coopplayerfollow.selectedpal
    if (state == states.jump)
        sprite_index = spr_fall
    with (obj_coopplayerfollow)
    {
        selectedpal = other.cooppal
        if (obj_player.character == "P")
            character = "N"
        else
            character = "P"
        scr_characterspr()
    }
}
scr_getinput()
event_inherited()
