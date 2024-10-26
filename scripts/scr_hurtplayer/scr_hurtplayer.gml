function scr_hurtplayer(argument0) //gml_Script_scr_hurtplayer
{
    var _hurt = spr_plug
    audio_stop_sound(sfx_tornadoair)
    if (obj_drawcontroller.superattacking == 0 && obj_player.state != states.titlescreen)
    {
        with (argument0)
        {
            if global.failcutscene
            {
            }
            else if (state == states.parry || state == states.debugstate || state == states.golf || state == states.slipbanan)
            {
            }
            else if (state == states.handstandjump && flash == 1)
            {
            }
            else if (state == states.tauntmoves || state == states.chainsaw)
            {
            }
            else if global.kungfu
            {
                if (state == states.blockstance)
                {
                    if (sprite_index != spr_player_airattackstart)
                    {
                        instance_create(x, y, obj_parryeffect)
                        image_index = 0
                    }
                    sprite_index = spr_player_airattackstart
                    hsp = (-xscale) * 2
                }
                else if (state != states.thrown && state != states.hit && (!hurted))
                {
                    instance_create(x, y, obj_parryeffect)
                    repeat (5)
                    {
                        with (create_debris(x, y, spr_slapstar))
                            vsp = irandom_range(-6, -11)
                    }
                    if (character == "P")
                    {
                        scr_soundeffect(choose(sfx_peppain1, sfx_peppain2))
                        scr_soundeffect(sfx_pephurt)
                    }
                    else if (character == "N")
                    {
                        scr_soundeffect(sfx_hurtN)
                        scr_soundeffect(sfx_pephurt)
                    }
                    else if (character == "V")
                    {
                        scr_soundeffect(sfx_pephurt)
                        scr_soundeffect(sfx_vigipain)
                    }
                    hitLag = 3
                    hitxscale = (x != other.x ? sign(other.x - x) : (-other.image_xscale))
                    state = states.hit
                    hitstunned = 50
                    hurted = 1
                    alarm[7] = hitstunned + 75
                    hithsp = 12
                    hitvsp = -5
                    hitX = x
                    hitY = y
                    sprite_index = spr_hurt
                    if (global.hp > 1)
                    {
                        global.hp--
                        with (obj_camera)
                            healthshaketime = 60
                    }
                    else
                    {
                        with (obj_music)
                            arena = 0
                        global.kungfu = 0
                        if (!instance_exists(obj_fadeout))
                        {
                            with (obj_player)
                                targetRoom = lastroom
                            instance_create(x, y, obj_fadeout)
                        }
                    }
                }
            }
            else if isgustavo
            {
                if (!hurted)
                {
                    state = states.ratmounthurt
                    movespeed = 6
                    vsp = -9
                    flash = 1
                    if (character == "P")
                    {
                        scr_soundeffect(choose(sfx_peppain1, sfx_peppain2))
                        scr_soundeffect(sfx_pephurt)
                    }
                    else if (character == "N")
                    {
                        scr_soundeffect(sfx_hurtN)
                        scr_soundeffect(sfx_pephurt)
                    }
                    else if (character == "V")
                    {
                        scr_soundeffect(sfx_pephurt)
                        scr_soundeffect(sfx_vigipain)
                    }
                    alarm[8] = 100
                    hurted = 1
                    instance_create(x, y, obj_spikehurteffect)
                    _hurt = spr_cutin
                }
            }
            else if (state == states.shotgundash)
            {
            }
            else if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.knightpepbump) && cutscene == 0)
            {
            }
            else if (state == states.ghost)
            {
            }
            else if (state == states.ghostpossess)
            {
                if (instance_exists(possessID) && object_get_parent(possessID) == 407)
                {
                    state = states.ghost
                    with (obj_baddie)
                    {
                        if (is_controllable && state == states.ghostpossess && playerid == other.id)
                            instance_destroy()
                    }
                }
            }
            else if (state == states.slipnslide)
            {
            }
            else if (state == states.trickjump)
            {
            }
            else if (state == states.chainsawbump)
            {
            }
            else if (state == states.bombpep && hurted == 0)
            {
            }
            else if (state == states.rideweenie)
            {
            }
            else if (state == states.slipnslide)
            {
            }
            else if (state == states.boxxedpep)
            {
                hsp = (-xscale) * 4
                vsp = -5
                state = states.bump
                sprite_index = spr_bump
                alarm[5] = 2
                alarm[8] = 60
                alarm[7] = 150
                hurted = 1
            }
            else if (pizzashield == 1)
            {
                pizzashield = 0
                scr_soundeffect(sfx_loseknight)
                with (instance_create(x, y, obj_sausageman_dead))
                    sprite_index = spr_pizzashield_collectible
                hsp = (-xscale) * 4
                vsp = -5
                state = states.bump
                sprite_index = spr_bump
                invhurt_buffer = 200
                alarm[8] = 60
                alarm[7] = 120
                hurted = 1
            }
            else if (state != states.hurt && state != states.ratmounthurt && state != states.grabbed && (hurted == 0 || state == states.cheesepep || state == states.cheesepepstickside || state == states.cheesepepstickup) && cutscene == 0)
            {
                if (state == states.mort || state == states.morthook || state == states.mortjump || state == states.mortattack)
                {
                    with (instance_create(x, y, obj_mortflyaway))
                        image_xscale = (-other.xscale)
                }
                if instance_exists(obj_hardmode)
                    global.heatmeter_count = (global.heatmeter_threshold - 1) * global.heatmeter_threshold_count
                _hurt = spr_cutin
                if (character == "V")
                    global.playerhealth -= 25
                if (state == states.barrel || state == states.barrelclimbwall || state == states.barreljump || state == states.barrelslide)
                {
                    repeat (4)
                        create_debris(x, y, spr_barreldebris)
                }
                if (character == "P")
                {
                    scr_soundeffect(choose(sfx_peppain1, sfx_peppain2))
                    scr_soundeffect(sfx_pephurt)
                }
                else if (character == "N")
                {
                    scr_soundeffect(sfx_hurtN)
                    scr_soundeffect(sfx_pephurt)
                }
                else if (character == "V")
                {
                    scr_soundeffect(sfx_pephurt)
                    scr_soundeffect(sfx_vigipain)
                }
                if global.kungfu
                {
                    if (global.hp > 1)
                    {
                        global.hp--
                        with (obj_camera)
                            healthshaketime = 60
                    }
                    else
                    {
                        with (obj_music)
                            arena = 0
                        global.kungfu = 0
                        if (!instance_exists(obj_fadeout))
                        {
                            with (obj_player)
                                targetRoom = lastroom
                            instance_create(x, y, obj_fadeout)
                        }
                    }
                }
                if (state == states.grabbed)
                {
                    if (object_index == obj_player1)
                        y = obj_player2.y
                    else
                        y = obj_player1.y
                }
                scr_soundeffect(sfx_pephurt)
                alarm[8] = 100
                alarm[7] = 100
                hurted = 1
                if instance_exists(obj_bosscontroller)
                {
                    obj_bosscontroller.playerhp--
                    invhurt_buffer = 200
                }
                if (xscale == other.image_xscale)
                    sprite_index = spr_hurtjump
                else
                    sprite_index = spr_hurt
                if (sprite_index == spr_hurt)
                    movespeed = 8
                else
                    movespeed = -8
                vsp = -14
                timeuntilhpback = 300
                instance_create(x, y, obj_spikehurteffect)
                state = states.hurt
                image_index = 0
                flash = 1
            }
            if _hurt
            {
                global.combotime -= 25
                global.style -= (25 + global.combo)
                global.hurtcounter += 1
                var loseamount = 150 * (global.stylethreshold + 1)
                if (!global.pizzadelivery)
                {
                    if (global.collect > loseamount)
                        global.collect -= loseamount
                    else
                        global.collect = 0
                    if (global.collect != 0)
                    {
                        if (character == "P" || character == "V")
                        {
                            repeat (10)
                            {
                                with (instance_create(x, y, obj_pizzaloss))
                                    sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
                            }
                        }
                        else
                        {
                            repeat (10)
                                instance_create(x, y, obj_pizzaloss)
                        }
                    }
                }
            }
        }
    }
    if instance_exists(obj_bosscontroller)
    {
        if (obj_bosscontroller.playerhp == 0)
        {
            with (obj_player)
            {
                state = states.outofpizza
                sprite_index = spr_outofpizza1
                image_index = 0
                vsp = -14
                obj_bosscontroller.alarm[1] = 250
                movespeed = -11
                instance_create(0, 0, obj_deathfadeout)
            }
        }
        else
            obj_bosscontroller.playerhurt = 1
    }
    return;
}

