if (!(place_meeting(x, y, obj_player1)))
    image_alpha += -0.05
else
    image_alpha += 0.05
if (image_alpha < 0)
    image_alpha = 0
if (image_alpha > 1)
    image_alpha = 1
if (obj_player.ispeppino == true)
    text = 15
else
    text = 10
