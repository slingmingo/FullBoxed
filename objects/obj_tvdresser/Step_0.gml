if (!(place_meeting(x, y, obj_player1)))
    alpha += -0.05
else
    alpha += 0.05
if (alpha < 0)
    alpha = 0
if (alpha > 1)
    alpha = 1
image_index = obj_tv.tvframepaletteselect
