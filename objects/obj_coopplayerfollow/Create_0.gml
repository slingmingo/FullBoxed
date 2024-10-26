spr_palette = spr_plug
selectedpal = global.pal2
jetpackflight = 0
if (obj_player.character == "P")
    character = "N"
else
    character = "P"
scr_characterspr()
sprite_index = spr_idle
event_inherited()
