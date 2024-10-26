if (obj_player1.character == "P" && obj_player1.spotlight == 1 && obj_player1.ispeppino)
    sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect4b, spr_pizzacollect5)
if ((obj_player1.character == "N" || (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
    sprite_index = choose(spr_noisecollect1, spr_noisecollect2, spr_noisecollect3, spr_noisecollect4, spr_noisecollect5)
image_speed = 0.35
depth = 11
