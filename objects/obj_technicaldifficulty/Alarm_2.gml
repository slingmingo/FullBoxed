scr_soundeffect(sfx_tvswitchoff)
instance_destroy()
with (playerid)
{
    if (!isgustavo)
        state = states.normal
    else
        state = states.ratmount
    visible = true
}
with (obj_ghostfollow)
{
    x = xstart
    y = ystart
}
