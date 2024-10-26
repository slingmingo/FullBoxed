function scr_player_angle() //gml_Script_scr_player_angle
{
    if (state == states.knightpepslopes)
    {
        if (grounded && (!(place_meeting(x, (y + 1), obj_solid))))
        {
            if scr_slope()
            {
                var AngleAffect = 1.6
                var Slope = instance_place(x, (y + 1), obj_slope)
                var SlopeXscale = abs(Slope.image_xscale)
                var SlopeYscale = abs(Slope.image_yscale) / AngleAffect
                var targetAngle = 50 / (SlopeXscale / SlopeYscale) * sign(Slope.image_xscale) / sign(Slope.image_yscale)
                angle = lerp(angle, targetAngle, 0.5)
            }
            else
                angle = lerp(angle, 0, 0.5)
        }
        else
            angle = lerp(angle, 0, 0.5)
    }
    else
        angle = lerp(angle, 0, 0.5)
}

