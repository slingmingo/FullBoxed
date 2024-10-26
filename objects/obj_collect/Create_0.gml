with (other)
{
    if (obj_player1.character == "P")
        sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
    if (obj_player1.character == "N")
        sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5)
    image_speed = 0.35
    global.collected = 0
    global.collectsound = 0
}
depth = 0
gotowardsplayer = 0
movespeed = 5
