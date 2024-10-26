if (floor(image_index) == (image_number - 1))
    image_speed = 0
if instance_exists(obj_bosscontroller)
{
    if (obj_bosscontroller.playerhurt == 0)
        global.rank = "p"
    else if (obj_bosscontroller.playerhp == 5 || (obj_bosscontroller.playerhp == 6 && obj_bosscontroller.playerhurt == 1))
        global.rank = "s"
    else if (obj_bosscontroller.playerhp == 4)
        global.rank = "a"
    else if (obj_bosscontroller.playerhp == 3)
        global.rank = "b"
    else if (obj_bosscontroller.playerhp == 2)
        global.rank = "c"
    else if (obj_bosscontroller.playerhp == 1)
        global.rank = "d"
    if (obj_player1.character == "P")
    {
        if (global.rank == "s")
            sprite_index = spr_rankS
        if (global.rank == "a")
            sprite_index = spr_rankA
        if (global.rank == "b")
            sprite_index = spr_rankB
        if (global.rank == "c")
            sprite_index = spr_rankC
        if (global.rank == "d")
            sprite_index = spr_rankD
        if (global.rank == "p")
            sprite_index = spr_rankP
    }
    else
    {
        if (global.rank == "s")
            sprite_index = spr_rankNS
        if (global.rank == "a")
            sprite_index = spr_rankNA
        if (global.rank == "b")
            sprite_index = spr_rankNB
        if (global.rank == "c")
            sprite_index = spr_rankNC
        if (global.rank == "d")
            sprite_index = spr_rankND
        if (global.rank == "p")
        {
            sprite_index = spr_rankNP
            if (floor(image_index) != (image_number - 1))
                image_speed = 0.4
        }
    }
}
else if (global.collect >= global.collectN)
{
    if (obj_player1.character == "P")
    {
        if (global.rank == "s")
            sprite_index = spr_rankS
        if (global.rank == "a")
            sprite_index = spr_rankA
        if (global.rank == "b")
            sprite_index = spr_rankB
        if (global.rank == "c")
            sprite_index = spr_rankC
        if (global.rank == "d")
            sprite_index = spr_rankD
        if (global.rank == "p")
            sprite_index = spr_rankP
    }
    else
    {
        if (global.rank == "s")
            sprite_index = spr_rankNS
        if (global.rank == "a")
            sprite_index = spr_rankNA
        if (global.rank == "b")
            sprite_index = spr_rankNB
        if (global.rank == "c")
            sprite_index = spr_rankNC
        if (global.rank == "d")
            sprite_index = spr_rankND
        if (global.rank == "p")
        {
            sprite_index = spr_rankNP
            if (floor(image_index) != (image_number - 1))
                image_speed = 0.4
        }
    }
}
if (global.collectN > global.collect)
{
    if (obj_player2.character == "P" && obj_player1.ispeppino)
    {
        if (global.rank == "s")
            sprite_index = spr_rankS
        if (global.rank == "a")
            sprite_index = spr_rankA
        if (global.rank == "b")
            sprite_index = spr_rankB
        if (global.rank == "c")
            sprite_index = spr_rankC
        if (global.rank == "d")
            sprite_index = spr_rankD
        if (global.rank == "p")
            sprite_index = spr_rankP
    }
    else
    {
        if (global.rank == "s")
            sprite_index = spr_rankNS
        if (global.rank == "a")
            sprite_index = spr_rankNA
        if (global.rank == "b")
            sprite_index = spr_rankNB
        if (global.rank == "c")
            sprite_index = spr_rankNC
        if (global.rank == "d")
            sprite_index = spr_rankND
        if (global.rank == "p")
            sprite_index = spr_rankP
    }
}
if (global.rank == "d")
    sprite_index = spr_rankD
if instance_exists(obj_treasureviewer)
    visible = false
if (obj_player.key_jump2 && canexit)
{
    global.levelcomplete = 1
    scr_playerreset()
    with (obj_player)
    {
        scr_playerreset()
        global.levelreset = 1
        obj_player1.targetDoor = "D"
        if instance_exists(obj_player2)
            obj_player2.targetDoor = "D"
        room = tower_2
        with (obj_camera)
        {
            rank_ix = 0
            prankpossible = 0
        }
        with (obj_music)
            alarm[0] = 2
    }
    with (obj_camera)
        rank_ix = 0
}
if canexit
    resultspush = lerp(resultspush, 300, 0.1)
else
    resultspush = 0
if (shake_mag != 0)
{
    shake = irandom_range(-2, 2)
    shake = irandom_range(-2, 2)
}
if (shake_mag == 0)
    shake = 0
