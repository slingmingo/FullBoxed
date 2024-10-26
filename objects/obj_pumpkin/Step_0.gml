if (obj_player.paletteselect != 3)
    distance = 500
else
    distance = distance_to_object(obj_player1) / 400
audio_group_set_gain(1, (global.option_sfx_volume / distance), 0)
image_alpha = 1 / distance * 3
