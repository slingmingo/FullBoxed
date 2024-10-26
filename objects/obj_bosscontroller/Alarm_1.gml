pause = 0
instance_activate_all()
scr_playerreset()
global.levelreset = 1
obj_player1.targetDoor = "D"
if instance_exists(obj_player2)
    obj_player2.targetDoor = "D"
if string_contains(room_get_name(room), "tutorial")
    room = tower_1
else
    room = tower_2
with (obj_camera)
    rank_ix = 0
with (obj_music)
    alarm[0] = 2
