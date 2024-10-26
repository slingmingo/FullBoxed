if (place_meeting(x, (y + 16), obj_player) && alpha > 0.5)
    alpha -= 0.05
else if ((!(place_meeting(x, (y + 16), obj_player))) && alpha <= 1)
    alpha += 0.05
if (alpha < 0.5)
    alpha = 0.5
