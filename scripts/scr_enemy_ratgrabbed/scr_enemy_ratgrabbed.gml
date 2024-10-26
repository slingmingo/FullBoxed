function scr_enemy_ratgrabbed() //gml_Script_scr_enemy_ratgrabbed
{
    var p = (object_index == obj_junk || object_get_parent(object_index) == 106)
    if (((!p) && state == 205) || (p && ratgrabbed))
    {
        visible = false
        x = ratplayerid.x
        y = ratplayerid.y
        if (!p)
            sprite_index = stunfallspr
        if ((!p) && state != states.stun)
            state = 205
        if (p && (!ratgrabbed))
            ratgrabbed = 1
        if (ratplayerid.state == states.ratmountspit && ratplayerid.image_index >= 5)
        {
            hsp = ratplayerid.xscale * 22
            vsp = -2
            image_xscale = (-ratplayerid.xscale)
            y = ratplayerid.y - 5
            thrown = 1
            visible = true
            if (!p)
            {
                grounded = 0
                hp = -1
                alarm[1] = 5
                state = states.stun
                stunned = 200
                hithsp = hsp
                hitvsp = vsp
                linethrown = 1
            }
            else
            {
                grounded = 0
                ratgrabbed = 0
            }
        }
    }
    return;
}

