x = obj_player.x
y = obj_player.y
if (obj_player.sprite_index != spr_player_airbash && obj_player.sprite_index != spr_playerN_spin && obj_player.sprite_index != spr_playerD_spin && obj_player.state != states.hypersoar)
    instance_destroy()
