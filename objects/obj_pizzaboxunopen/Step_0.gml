var roomname = string_letters(room_get_name(room))
if (place_meeting(x, y, obj_player) && (sprite_index == spr_pizzaboxunopen || sprite_index == spr_noisetoppin_cage))
{
    global.combotime = 60
    ds_list_add(global.saveroom, id)
    if (!audio_is_playing(sfx_collecttoppin))
        scr_soundeffect(sfx_collecttoppin)
    if (content == obj_pizzakinshroom)
        tv_do_expression(spr_tv_mushroom)
    if (content == obj_pizzakincheese)
        tv_do_expression(spr_tv_cheese)
    if (content == obj_pizzakintomato)
        tv_do_expression(spr_tv_tomato)
    if (content == obj_pizzakinsausage)
        tv_do_expression(spr_tv_sausage)
    if (content == obj_pizzakinpineapple)
        tv_do_expression(spr_tv_pineapple)
    if (content == obj_noisebomb)
    {
        with (obj_player)
        {
            state = states.tauntmoves
            sprite_index = spr_player_bossintro
            image_index = 0
        }
        with (instance_create(x, (y - 25), content))
            sprite_index = spr_noisebomb_intro
        instance_create(x, y, obj_taunteffect)
        instance_create(x, (y + 600), obj_itspizzatime)
        global.panic = 1
        global.wave = 0
        global.maxwave = (global.minutes * 60 + global.seconds) * 60
        if global.panicbg
            scr_panicbg_init()
    }
    if (content == obj_pizzakinshroom)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        instance_create(x, y, obj_taunteffect)
        with (instance_create(x, (y - 25), content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmasshroomtoppin_intro
            else
                sprite_index = spr_toppinshroom_intro
        }
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + (string(5 - global.toppintotal)) + " MORE TOPPINS!"
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.shroomfollow = 1
    }
    if (content == obj_pizzakincheese)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmascheesetoppin_intro
            else
                sprite_index = spr_toppincheese_intro
        }
        instance_create(x, y, obj_taunteffect)
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + (string(5 - global.toppintotal)) + " MORE TOPPINS!"
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.cheesefollow = 1
    }
    if (content == obj_pizzakintomato)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmastomatotoppin_intro
            else
                sprite_index = spr_toppintomato_intro
        }
        instance_create(x, y, obj_taunteffect)
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + (string(5 - global.toppintotal)) + " MORE TOPPINS!"
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.tomatofollow = 1
    }
    if (content == obj_pizzakinsausage)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmassausagetoppin_intro
            else
                sprite_index = spr_toppinsausage_intro
        }
        instance_create(x, y, obj_taunteffect)
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + (string(5 - global.toppintotal)) + " MORE TOPPINS!"
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.sausagefollow = 1
    }
    if (content == obj_pizzakinpineapple)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmaspineappletoppin_intro
            else
                sprite_index = spr_toppinpineapple_intro
        }
        instance_create(x, y, obj_taunteffect)
        global.heattime = 60
        global.style += 10
        ds_list_add(global.saveroom, id)
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + (string(5 - global.toppintotal)) + " MORE TOPPINS!"
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.pineapplefollow = 1
    }
    if (content == obj_noisey)
    {
        scr_soundeffect(sfx_enemyprojectile)
        with (instance_create(x, (y - 25), content))
        {
            image_xscale = other.image_xscale
            state = states.stun
            stunned = 20
            vsp = -5
        }
    }
    with (create_debris(x, (y - 32), spr_cagedebris, 0))
        image_index = 0
    with (create_debris(x, (y + 32), spr_cagedebris, 0))
        image_index = 1
    with (create_debris((x - 10), y, spr_cagedebris, 0))
        image_index = 2
    with (create_debris(x, y, spr_cagedebris, 0))
        image_index = 3
    with (create_debris((x + 10), y, spr_cagedebris, 0))
        image_index = 4
    instance_destroy()
}
