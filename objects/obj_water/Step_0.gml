if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (state != states.gotoplayer && state != states.trashjump && state != 209 && state != states.mach3 && state != states.parry && sprite_index != spr_mach3boost)
        {
            if place_meeting(x, (y + 1), other)
            {
                if (state != states.trashroll)
                {
                    scr_losepoints()
                    image_index = 0
                    state = states.fireass
                    movespeed = hsp
                    vsp = -14
                    instance_create(x, (y + 20), obj_piranneapplewater)
                    sprite_index = spr_scaredjump1
                    with (instance_create(x, y, obj_superdashcloud))
                        sprite_index = spr_watereffect
                }
                else
                {
                    vsp = -6
                    sprite_index = spr_player_jumpdive1
                    image_index = 0
                }
            }
        }
        else
        {
            vsp = 0
            if (!instance_exists(obj_bumpeffect))
            {
                with (instance_create(obj_player.x, obj_player.y, obj_bumpeffect))
                    sprite_index = spr_watereffect
            }
        }
    }
}
with (instance_place(x, (y - 1), obj_baddie))
    instance_destroy()
