x += hsp
y += vsp
image_xscale = dir
if (active == 1 && hsp < hookspeed && dir == 1)
    hsp += 0.5
else if (active == 1 && hsp > hookspeed && dir == -1)
    hsp -= 0.5
if (hsp > hookspeed && dir == 1)
    hsp = hookspeed
else if (hsp < hookspeed && dir == -1)
    hsp = hookspeed
