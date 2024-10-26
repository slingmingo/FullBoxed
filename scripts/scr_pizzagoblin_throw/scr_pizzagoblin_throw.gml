function scr_pizzagoblin_throw() //gml_Script_scr_pizzagoblin_throw
{
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0
        global.throw_frame[398] = 11
        global.throw_frame[732] = 13
        global.throw_frame[314] = 18
        global.throw_frame[315] = 2
        global.throw_frame[482] = 7
        global.throw_frame[733] = 2
        global.throw_frame[798] = 2
        global.throw_frame[369] = 8
        global.throw_frame[204] = 6
        global.throw_frame[429] = 3
        global.throw_frame[115] = 8
        global.throw_frame[605] = 15
        global.throw_frame[56] = 10
        global.throw_frame[747] = 2
        global.throw_frame[540] = 6
        global.throw_frame[332] = 9
        global.throw_frame[525] = 13
        global.throw_frame[177] = 3
        global.throw_frame[252] = 7
        global.throw_frame[487] = 11
        global.throw_sprite = spr_plug
        global.throw_sprite[398] = spr_pizzagoblin_throwbomb
        global.throw_sprite[732] = spr_canongoblin_throwbomb
        global.throw_sprite[314] = spr_archergoblin_shoot
        global.throw_sprite[315] = spr_spitcheese_spit
        global.throw_sprite[482] = spr_tank_shoot
        global.throw_sprite[733] = spr_trash_throw
        global.throw_sprite[798] = spr_robot_attack
        global.throw_sprite[369] = spr_kentukykenny_throw
        global.throw_sprite[204] = spr_pizzard_shoot
        global.throw_sprite[429] = spr_pepgoblin_kick
        global.throw_sprite[115] = spr_pepbat_kick
        global.throw_sprite[605] = spr_swedishmonkey_eat
        global.throw_sprite[56] = spr_ranch_shoot
        global.throw_sprite[747] = spr_pickle_attack
        global.throw_sprite[540] = spr_tank_shoot
        global.throw_sprite[332] = spr_shrimp_knife
        global.throw_sprite[525] = spr_pizzaslug_cough
        global.throw_sprite[177] = spr_ufolive_shoot
        global.throw_sprite[252] = spr_kentukybomber_attack
        global.throw_sprite[487] = spr_ufogrounded_shoot
        global.reset_timer = 0
        global.reset_timer[398] = 200
        global.reset_timer[732] = 200
        global.reset_timer[314] = 200
        global.reset_timer[315] = 100
        global.reset_timer[482] = 400
        global.reset_timer[733] = 100
        global.reset_timer[798] = 150
        global.reset_timer[369] = 200
        global.reset_timer[204] = 100
        global.reset_timer[429] = 200
        global.reset_timer[115] = 200
        global.reset_timer[605] = 200
        global.reset_timer[56] = 100
        global.reset_timer[747] = 200
        global.reset_timer[540] = 100
        global.reset_timer[332] = 60
        global.reset_timer[525] = 10
        global.reset_timer[177] = 100
        global.reset_timer[252] = 100
        global.reset_timer[487] = 100
    }
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (floor(image_index) == (image_number - 1))
    {
        state = states.walk
        sprite_index = walkspr
    }
    if (bombreset <= 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index]
        sprite_index = global.throw_sprite[object_index]
        if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
            scr_soundeffect(sfx_enemyprojectile)
        switch object_index
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_pizzagoblinbomb))
                {
                    defused = 1
                    movespeed = 5
                    image_xscale = other.image_xscale
                    vsp = -10
                    countdown = 80
                }
                break
            case obj_canongoblin:
                with (instance_create(x, y, obj_canongoblinbomb))
                    image_xscale = other.image_xscale
                break
            case obj_noisegoblin:
                with (instance_create(x, y, obj_noisegoblin_arrow))
                {
                }
                break
            case obj_spitcheese:
                if (spitcheesespr == spr_spitcheese_spit)
                {
                    with (instance_create((x + image_xscale * 6), (y - 6), obj_spitcheesespike))
                    {
                        image_xscale = other.image_xscale
                        hsp = other.image_xscale * 5
                        vsp = -6
                    }
                }
                else
                {
                    with (instance_create((x + image_xscale * 6), (y - 6), obj_cheeseball))
                    {
                        image_xscale = other.image_xscale
                        hsp = other.image_xscale * 5
                        vsp = -6
                    }
                }
                break
            case obj_trash:
            case obj_robot:
                with (instance_create((x + image_xscale * 4), y, obj_robotknife))
                {
                    grav = 0
                    image_xscale = other.image_xscale
                    hsp = other.image_xscale * 5
                }
                break
            case obj_kentukykenny:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale
                break
            case obj_pizzard:
                with (instance_create(x, y, obj_pizzard_bolt))
                    image_xscale = other.image_xscale
                break
            case obj_swedishmonkey:
                with (instance_create(x, y, obj_slipnslide))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                    hsp = (-other.image_xscale) * 4
                    vsp = -5
                }
                with (obj_slipnslide)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                break
            case obj_pepgoblin:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case obj_pepbat:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case obj_pickle:
                attacking = 0
                with (instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                break
            case obj_tank:
                with (instance_create((x + image_xscale * 6), (y - 6), obj_canongoblinbomb))
                {
                    image_xscale = other.image_xscale
                    hsp = other.image_xscale * 5
                }
                break
            case obj_thug_red:
                with (instance_create((x + 8 * image_xscale), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = other.image_xscale * 5
                }
                break
            case obj_rancher:
                with (instance_create((x + image_xscale * 6), (y + 26), obj_rancher_bullet))
                    image_xscale = other.image_xscale
                break
            case obj_smokingpizzaslice:
                substate = choose(states.walk, states.idle, states.idle)
                if (substate == states.walk)
                    image_xscale = choose(-1, 1, (-image_xscale))
                substate_buffer = substate_max
                with (instance_create((x + 50 * image_xscale), (y + 20), obj_smokingprojectile))
                    image_xscale = other.image_xscale
                break
            case obj_thug_green:
                with (instance_create((x + 8 * image_xscale), y, obj_junkenemy))
                {
                    image_xscale = other.image_xscale
                    hsp = other.image_xscale * 7
                    vsp = -8
                }
                break
            case obj_miniufo:
                instance_create(x, y, obj_warplaser)
                break
            case obj_miniufo_grounded:
                with (instance_create((x + 8 * image_xscale), y, obj_enemybullet))
                {
                    sprite_index = spr_ufogrounded_bullet
                    image_xscale = other.image_xscale
                }
                break
            case obj_kentukybomber:
                instance_create(x, (y + 70), obj_kentukybomb)
                break
            case obj_bazookabaddie:
                var xx = x + 72 * image_xscale
                instance_create(xx, y, obj_bazooka)
                create_particle(xx, y, 6)
                break
        }

    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
    return;
}

