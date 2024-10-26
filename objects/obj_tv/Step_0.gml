if (room == Disclaimer || room == bossroom_1 || room == rank_room || string_contains(room_get_name(room), "tutorial") || string_contains(room_get_name(room), "tower") || room == rm_levelselect || room == timesuproom || room == boss_room1 || room == characterselect || room == hub_loadingscreen || room == Titlescreen || room == rm_video)
{
    visible = false
    sprite_index = spr_tv_off
}
else
{
    visible = true
    imindex += 0.4
}
if (obj_player.character == "P")
    bgindex = 0
if (obj_player.character == "N")
    bgindex = 1
if (obj_player.character == "D")
    bgindex = 2
if (obj_player.character == "V")
    bgindex = 3
if instance_exists(obj_hungrypillar)
{
    var p = 0
    with (obj_hungrypillar)
    {
        if bbox_in_camera(view_camera[0], 0)
            p = 1
    }
    if (p != pillar_on_camera)
        pillar_on_camera = p
}
else
    pillar_on_camera = 0
if (obj_player.vsp < 0)
    disvsp = obj_player1.vsp * -1
else
    disvsp = obj_player1.vsp
if (obj_player.hsp < 0)
    dishsp = obj_player1.hsp * -1
else
    dishsp = obj_player1.hsp
if (obj_player.movespeed > 0)
    mockmovespeed = obj_player.movespeed
else
    mockmovespeed = (-obj_player.movespeed)
machbar = clamp((dishsp * 6 + disvsp * 3), 0, 110)
if (machdisplay != machbar)
{
    if (machdisplay < machbar)
        machdisplay += (0.5 + mockmovespeed / 10)
    if (machdisplay > machbar)
        machdisplay -= (1 + mockmovespeed / 10)
}
else
    machincrease = 1
shakeplus = random_range((-shakemult), shakemult)
shakemult = Approach(shakemult, 0, 0.15)
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
    visible = false
tvdefault = (sprite_index == spr_tv_open ? 381 : 384)
image_speed = 0.35
if (targetgolf != noone && (!instance_exists(targetgolf)))
    targetgolf = -4
if (targetgolf != -4 && (!view_visible[1]))
{
    view_visible[1] = true
    view_enabled = true
}
if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
    if (prompt != -4)
        prompt_buffer = 2
    bubbleindex += image_speed
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0
        switch bubblespr
        {
            case spr_tv_bubbleopen:
                bubblespr = spr_tv_bubble
                break
            case spr_tv_bubbleclose:
                bubblespr = spr_tv_bubbleclosed
                if (prompt == -4 || prompt == "")
                    bubblespr = -4
                break
        }

    }
}
switch state
{
    case states.normal:
        if string_contains(room_get_name(room), "secret")
        {
            if (obj_player.character == "P")
                idlespr = spr_tv_exprsecret
            if (obj_player.character == "N" || obj_player.character == "D")
                idlespr = spr_tv_exprsecretN
        }
        else
            idlespr = spr_tv_idle
        if (obj_player.character == "N" || obj_player.character == "D")
        {
            idlespr = spr_tv_idleN
            if global.panic
                idlespr = spr_tv_exprpanicN
        }
        if obj_player.isgustavo
        {
            idlespr = spr_tv_idleG
            if global.panic
                idlespr = spr_tv_escapeG
        }
        if (obj_player.character == "V")
        {
            idlespr = spr_tv_idleV
            if global.panic
                idlespr = spr_tv_idleV
        }
        var _state = obj_player1.state
        if (_state == states.tauntmoves || _state == states.chainsaw)
            _state = obj_player1.tauntstoredstate
        var _transfo = 1
        switch _state
        {
            case states.knightpep:
            case states.knightpepattack:
            case states.knightpepslopes:
                idlespr = spr_tv_knight
                break
            case states.bombpep:
                idlespr = spr_tv_bombpep
                break
            case states.fireass:
                idlespr = spr_tv_fireass
                if (obj_player1.sprite_index == obj_player1.spr_scaredjump1 || obj_player1.sprite_index == obj_player1.spr_scaredjump2)
                    idlespr = spr_tv_scaredjump
                break
            case states.tumble:
                if (obj_player1.sprite_index == obj_player1.spr_tumble || obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend)
                    idlespr = spr_tv_tumble
                break
            case states.firemouth:
                idlespr = spr_tv_firemouth
                break
            case states.ghost:
            case states.ghostpossess:
                idlespr = spr_tv_ghost
                break
            case states.stunned:
                if (obj_player1.sprite_index == obj_player1.spr_squished)
                    idlespr = spr_tv_squished
                break
            case states.normal:
            case states.jump:
            case states.handstandjump:
            case states.crouch:
            case states.ladder:
                with (obj_player1)
                {
                    if shotgunAnim
                        other.idlespr = spr_tv_shotgun
                    else if global.mort
                        other.idlespr = spr_tv_mort
                }
                break
            case states.freefallprep:
            case states.freefall:
            case states.freefallland:
                if obj_player1.shotgunAnim
                    idlespr = spr_tv_shotgun
                break
            case states.pistol:
                if global.mort
                    idlespr = spr_tv_mort
                break
            case states.shotgun:
            case states.shotgunfreefall:
            case states.shotgunjump:
            case states.shotgundash:
            case states.shotguncrouch:
            case states.shotguncrouchjump:
                idlespr = spr_tv_shotgun
                break
            case states.barrel:
                idlespr = spr_tv_barrel
                break
            case states.golf:
                idlespr = spr_tv_golf
                break
            case states.rocket:
                idlespr = spr_tv_rocket
                break
            case states.cheeseball:
                idlespr = spr_tv_cheeseball
                break
            case states.cheesepep:
            case states.cheesepepstick:
            case states.cheesepepstickside:
            case states.cheesepepstickup:
                idlespr = spr_tv_cheesepep
                break
            case states.boxxedpep:
            case states.boxxedpepjump:
            case states.boxxedpepspin:
                idlespr = spr_tv_boxxedpep
                break
            case states.mach2:
            case states.climbwall:
            case states.machroll:
            case states.grind:
                if obj_player1.skateboarding
                    idlespr = spr_tv_clown
                break
            default:
                _transfo = 0
                break
        }

        if (obj_player1.character == "N" || obj_player.character == "D")
        {
            var spr = sprite_get_name(idlespr)
            spr = asset_get_index(concat(spr, "N"))
            if (spr > -1)
                idlespr = spr
        }
        if (!_transfo)
        {
            with (obj_player1)
            {
                if (state == states.mach3 && sprite_index == spr_crazyrun)
                {
                    if (character == "P")
                        tv_do_expression(spr_tv_exprmach4)
                    else if (character == "N" || obj_player.character == "D")
                        tv_do_expression(spr_tv_exprmach4N)
                }
                if ((state == states.mach3 || sprite_index == spr_mach3boost) && sprite_index != spr_crazyrun)
                {
                    if (character == "P")
                        tv_do_expression(spr_tv_exprmach3)
                    else if (character == "N" || obj_player.character == "D")
                        tv_do_expression(spr_tv_exprmach3N)
                }
                else if (state == states.hurt)
                {
                    if (obj_player.character == "P" || obj_player.character == "V")
                        tv_do_expression(spr_tv_exprhurt)
                    else if (obj_player.character == "N" || obj_player.character == "D")
                        tv_do_expression(spr_tv_exprhurtN)
                    else if (state == states.ratmounthurt)
                        tv_do_expression(spr_tv_hurtG)
                }
                if (global.combo >= 15 && (!obj_player.isgustavo) && state != states.mach3)
                {
                    if (character == "P")
                        tv_do_expression(spr_tv_exprcombo)
                    else if (character == "N" || obj_player.character == "D")
                        tv_do_expression(spr_tv_exprcomboN)
                }
                else if (global.stylethreshold >= 3)
                {
                    if (obj_player.character == "P")
                        idlespr = spr_tv_exprheat
                    else if (obj_player.character == "N" || obj_player.character == "D")
                        idlespr = spr_tv_exprheatN
                }
            }
        }
        switch sprite_index
        {
            case spr_tv_off:
                if visible
                {
                    sprite_index = spr_tv_open
                    image_index = 0
                }
                break
            case spr_tv_open:
                if (floor(image_index) == (image_number - 1))
                    sprite_index = idlespr
                break
            case spr_tv_idle:
            case spr_tv_idleN:
                if (idleanim > 0)
                    idleanim--
                if (sprite_index != idlespr)
                    sprite_index = idlespr
                if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                {
                    if (obj_player1.character == "P")
                        sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2)
                    if (obj_player1.character == "N" || obj_player.character == "D")
                        sprite_index = choose(spr_tv_idleanim1N, spr_tv_idleanim2N)
                    image_index = 0
                }
                break
            case spr_tv_idleanim1:
            case spr_tv_idleanim2:
            case spr_tv_idleanim1N:
            case spr_tv_idleanim2N:
                if (floor(image_index) == (image_number - 1))
                {
                    sprite_index = idlespr
                    idleanim = 240 + 60 * (irandom_range(-1, 2))
                }
                if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
                    sprite_index = idlespr
                break
            default:
                sprite_index = idlespr
        }

        if (sprite_index != spr_tv_open)
        {
            if (!ds_list_empty(tvprompts_list))
            {
                var b = ds_list_find_value(tvprompts_list, 0)
                prompt_buffer = prompt_max
                if (b[0] != "" && b[0] != -4)
                {
                    bubblespr = spr_tv_bubbleopen
                    bubbleindex = 0
                    prompt = b[0]
                    promptspd = b[3]
                    promptx = promptxstart
                }
                else
                {
                    if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
                        bubblespr = spr_tv_bubbleclose
                    if (bubblespr == spr_tv_bubbleclosed)
                        bubblespr = -4
                    bubbleindex = 0
                    promptx = promptxstart
                    prompt = -4
                }
                if (b[1] == 0)
                {
                    sprite_index = spr_tv_open
                    image_index = 0
                    tvsprite = b[2]
                }
                else
                {
                    tvsprite = b[2]
                    sprite_index = tvsprite
                    image_index = 0
                }
                state = states.transitioncutscene
            }
            else
                bubblespr = -4
        }
        break
    case states.transitioncutscene:
        if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
            sprite_index = tvsprite
        if (sprite_index == tvsprite)
        {
            if (prompt_buffer > 0)
                prompt_buffer--
            else
            {
                promptx = promptxstart
                ds_list_delete(tvprompts_list, 0)
                state = states.normal
            }
        }
        break
    case 250:
        sprite_index = spr_tv_whitenoise
        if (noisebuffer > 0)
            noisebuffer--
        else
        {
            noisebuffer = noisemax
            if (expressionsprite != -4)
            {
                state = 251
                sprite_index = expressionsprite
            }
            else
                state = states.normal
            image_index = 0
        }
        break
    case 251:
        switch expressionsprite
        {
            case spr_tv_exprhurt:
            case spr_tv_exprhurtN:
                if (obj_player1.state != states.hurt)
                {
                    if (expressionbuffer > 0)
                        expressionbuffer--
                    else
                    {
                        state = 250
                        expressionsprite = -4
                    }
                }
                break
            case spr_tv_hurtG:
                if (obj_player1.state != states.ratmounthurt)
                {
                    if (expressionbuffer > 0)
                        expressionbuffer--
                    else
                    {
                        state = 250
                        expressionsprite = -4
                    }
                }
                break
            case spr_tv_exprcombo:
            case spr_tv_exprcomboN:
                if (global.combo < 15 || obj_player1.isgustavo)
                {
                    state = 250
                    expressionsprite = -4
                    if (obj_player1.state == states.hurt)
                        tv_do_expression(spr_tv_exprhurt)
                }
                break
            case spr_tv_exprcollectN:
            case spr_tv_happyG:
                if (expressionbuffer > 0)
                    expressionbuffer--
                else
                {
                    state = 250
                    expressionsprite = -4
                }
                break
            case spr_tv_mushroom:
            case spr_tv_cheese:
            case spr_tv_tomato:
            case spr_tv_sausage:
            case spr_tv_pineapple:
                if (expressionbuffer > 0)
                    expressionbuffer--
                else
                {
                    state = 250
                    expressionsprite = -4
                }
                break
            case spr_tv_john:
                if pillar_on_camera
                    tv_do_expression(spr_tv_john)
                else
                {
                    state = 250
                    expressionsprite = -4
                }
                break
            case spr_tv_exprcollect:
                if (expressionbuffer > 0)
                    expressionbuffer--
                else
                {
                    state = 250
                    expressionsprite = -4
                }
                if (!obj_player1.ispeppino)
                    tv_do_expression(spr_tv_exprcollectN)
                break
            case spr_tv_exprmach3:
            case spr_tv_exprmach3N:
                with (obj_player1)
                {
                    if (state != states.mach3 && (state != states.chainsaw || tauntstoredstate != states.mach3) && sprite_index != spr_mach3boost && mach4mode == 0)
                    {
                        other.state = 250
                        other.expressionsprite = -4
                    }
                    if (obj_player1.sprite_index == spr_crazyrun)
                    {
                        if (character == "P")
                            tv_do_expression(spr_tv_exprmach4)
                        else if (character == "N" || obj_player.character == "D")
                            tv_do_expression(spr_tv_exprmach4N)
                    }
                }
                break
            case spr_tv_exprmach4:
            case spr_tv_exprmach4N:
                with (obj_player1)
                {
                    if (sprite_index != spr_crazyrun)
                    {
                        other.state = 250
                        other.expressionsprite = -4
                    }
                }
                break
            case spr_tv_exprheat:
            case spr_tv_exprheatN:
                _transfo = 0
                with (obj_player1)
                {
                    if (!scr_transformationcheck())
                        _transfo = 1
                    if isgustavo
                        _transfo = 1
                }
                if (global.stylethreshold < 3 || _transfo)
                {
                    state = 250
                    expressionsprite = -4
                }
                break
        }

        if (!ds_list_empty(tvprompts_list))
        {
            state = 250
            expressionsprite = -4
        }
        break
}

var change_pos = 0
if (obj_player.x > (room_width - 224) && obj_player.y < 187)
    change_pos = 1
if (bubblespr != -4 && obj_player.x > 316 && obj_player.y < 101)
    change_pos = 1
var spd = 15
if change_pos
    hud_posY = Approach(hud_posY, -300, spd)
else
    hud_posY = Approach(hud_posY, 0, spd)
pizzaface_index += 0.35
hand_index += 0.35
johnface_index += 0.35
if (global.panic && global.fill > 17 && (!global.timeattack))
{
    showtime_buffer = 100
    if (!instance_exists(obj_ghostcollectibles))
        timer_y = Approach(timer_y, timer_ystart, 1)
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 4)
}
else if (global.panic && (!global.timeattack))
{
    if (pizzaface_sprite == spr_timer_pizzaface1)
    {
        pizzaface_sprite = spr_timer_pizzaface2
        pizzaface_index = 0
    }
    else if (pizzaface_sprite == spr_timer_pizzaface2)
    {
        if (floor(pizzaface_index) == (sprite_get_number(pizzaface_sprite) - 1))
        {
            pizzaface_sprite = spr_timer_pizzaface3
            pizzaface_index = 0
        }
    }
    else if (showtime_buffer > 0)
        showtime_buffer--
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 1)
}
else
{
    pizzaface_sprite = spr_timer_pizzaface1
    hand_sprite = spr_timer_hand1
    timer_y = timer_ystart + 212
}
if (global.panic && global.fill < (chunkmax / 5))
    hand_sprite = spr_timer_hand2
barfill_x -= 0.2
if (barfill_x < -173)
    barfill_x = 0
if (pizzaface_index > (sprite_get_number(pizzaface_sprite) - 1))
    pizzaface_index = frac(pizzaface_index)
if (hand_index > (sprite_get_number(hand_sprite) - 1))
    hand_index = frac(hand_index)
if (johnface_index > (sprite_get_number(johnface_sprite) - 1))
    johnface_index = frac(johnface_index)
combo_posX = Wave(-5, 5, 2, 20)
if (global.combotime > 0 && global.combo != 0)
{
    switch combo_state
    {
        case 0:
            combo_posY += combo_vsp
            combo_vsp += 0.5
            if (combo_posY > 20)
                combo_state++
            break
        case 1:
            combo_posY = lerp(combo_posY, 0, 0.05)
            if (combo_posY < 1)
            {
                combo_posY = 0
                combo_vsp = 0
                combo_state++
            }
            break
        case 2:
            if (global.combotime < 30)
            {
                combo_posY += combo_vsp
                if (combo_vsp < 20)
                    combo_vsp += 0.5
                if (combo_posY > 0)
                {
                    combo_posY = 0
                    combo_vsp = -1
                    if (global.combotime < 15)
                        combo_vsp = -2
                }
            }
            else
                combo_posY = Approach(combo_posY, 0, 10)
            break
    }

}
else
{
    combo_posY = Approach(combo_posY, -500, 5)
    combo_vsp = 0
    combo_state = 0
}
combofill_index += 0.35
if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
    combofill_index = frac(combofill_index)
if (timerseconds < 10)
    timerseconds = string_concat("0", global.seconds)
else
    timerseconds = global.seconds
if (capindex > 2)
    capindex = 0
capwait -= 0.05
if (capwait < 0)
{
    capwait = capispeed
    capindex += 1
}
if (global.seconds <= 30 && global.minutes == 0 && (!global.timeattack))
    barcolor = 255
if (global.seconds == 30 && global.minutes == 0 && (!audio_is_playing(sfx_30secondswarning)) && (!global.timeattack))
    scr_soundeffect(sfx_30secondswarning)
if (global.combo >= 25)
    combotextpallete = 2
else
    combotextpallete = 1
