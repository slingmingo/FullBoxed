grounded = place_meeting(x, (y + vsp), par_collision)
hcollidescenario = move_and_collide(hsp, 0, 189, abs(hsp))
var hCol = hcollidescenario
var vCol = move_and_collide(0, vsp, 189, (abs(vsp) + 1), hsp, vsp, hsp, vsp)
if ((!grounded) && vsp < 20)
    vsp += grav
if grounded
    hsp /= 1.5
