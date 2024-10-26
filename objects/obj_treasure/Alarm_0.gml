var p = noone
if (player == obj_gamestarter)
    p = obj_player1.id
else if (player == obj_hoop)
    p = obj_player2.id
p.state = states.normal
global.collect += 3000
