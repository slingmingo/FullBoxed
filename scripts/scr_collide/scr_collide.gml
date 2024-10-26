var _temp_local_var_3;
function scr_collide() //gml_Script_scr_collide
{
    grounded = false
    var vsp_final = vsp + vsp_carry
    vsp_carry = 0
    var _temp_local_var_3 = abs(vsp_final)
    if (abs(vsp_final) <= 0)
    {
    }
    else
    {
        while (true)
        {
            if (!(scr_solid(x, (y + sign(vsp_final)))))
            {
                y += sign(vsp_final)
                var _temp_local_var_3 = (abs(vsp_final) - 1)
                if (abs(vsp_final) - 1)
                    continue
                break
            }
            else
                vsp = 0
        }
    }
    var hsp_final = hsp + hsp_carry
    hsp_carry = 0
    var _temp_local_var_3 = abs(hsp_final)
    if (abs(hsp_final) <= 0)
    {
    }
    else
    {
        while (true)
        {
            var k = 1
            if (k <= 4)
            {
                if (scr_solid((x + sign(hsp_final)), y) && (!(scr_solid((x + sign(hsp_final)), (y - k)))))
                    y -= k
                if ((!(scr_solid((x + sign(hsp_final)), y))) && (!(scr_solid((x + sign(hsp_final)), (y + 1)))) && scr_solid((x + sign(hsp_final)), (y + k + 1)))
                    y += k
                for (k++; k <= 4; k++)
                {
                    if (scr_solid((x + sign(hsp_final)), y) && (!(scr_solid((x + sign(hsp_final)), (y - k)))))
                        y -= k
                    if ((!(scr_solid((x + sign(hsp_final)), y))) && (!(scr_solid((x + sign(hsp_final)), (y + 1)))) && scr_solid((x + sign(hsp_final)), (y + k + 1)))
                        y += k
                }
            }
            if (!(scr_solid((x + sign(hsp_final)), y)))
            {
                x += sign(hsp_final)
                var _temp_local_var_3 = (abs(hsp_final) - 1)
                if (abs(hsp_final) - 1)
                    continue
                break
            }
            else
                hsp = 0
        }
    }
    if (vsp < 10)
        vsp += grav
    if (platformid != noone)
    {
        if (vsp < 0 || (!instance_exists(platformid)) || (!(place_meeting(x, (y + 12 + abs(platformid.v_velocity) * 2), platformid))))
        {
            platformid = noone
            y = floor(y)
        }
        else
        {
            grounded = true
            vsp = grav
            if (platformid.vsp > 0)
                vsp = abs(platformid.v_velocity)
            y = platformid.y - 46
            if (!(place_meeting(x, (y + 1), platformid)))
            {
                var i = 0
                while (!(place_meeting(x, (y + 1), platformid)))
                {
                    y++
                    if (i > abs(sprite_height))
                        break
                }
            }
            if (platformid.v_velocity != 0)
            {
                if scr_solid(x, y)
                {
                    i = 0
                    while scr_solid(x, y)
                    {
                        y--
                        if (i > 32)
                            break
                        else
                            i++
                    }
                }
                if scr_solid(x, y)
                {
                    i = 0
                    while scr_solid(x, y)
                    {
                        y++
                        if (i > 64)
                            break
                        else
                            i++
                    }
                }
            }
        }
    }
    grounded |= scr_solid(x, (y + 1))
    grounded |= ((!(place_meeting(x, y, obj_platform))) && place_meeting(x, (y + 1), obj_platform))
}

