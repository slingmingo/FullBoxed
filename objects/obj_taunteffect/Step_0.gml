if (instance_exists(player) && player.state != states.tauntmoves && player.sprite_index != player.spr_taunt)
    instance_destroy()
x = obj_player.x
y = obj_player.y
image_xscale = obj_player.xscale
