if (!instance_exists(ID))
{
    instance_destroy()
    return;
}
x = ID.x
y = ID.y
image_xscale = ID.image_xscale
image_yscale = ID.image_yscale
with (ID)
{
    if (object_index == obj_coolpineapple || object_index == obj_ghostknight || object_index == obj_forknight || object_index == obj_noisey || object_index == obj_smokingpizzaslice)
    {
        if (state != states.walk && state != states.rage)
        {
            hitboxcreate = 0
            instance_destroy(other)
        }
    }
    switch object_index
    {
        case obj_pepperman:
            other.x = x + image_xscale * 8
            if (state != states.shoulderbash)
                instance_destroy(other)
            break
        case obj_badrat:
            other.x = x + image_xscale * 16
            if (state != states.punch)
                instance_destroy(other)
            break
        case obj_farmerbaddie:
        case obj_farmerbaddie2:
        case obj_farmerbaddie3:
            other.x = x + image_xscale * 16
            if (state != states.punch)
                instance_destroy(other)
            break
        case obj_peppinoclone:
            other.x = x - image_xscale * 10
            if (state != states.punch)
                instance_destroy(other)
            break
        case obj_robot:
            if (state != states.mach2 && state != states.slap && state != states.tackle)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            else if (state == states.slap)
                other.x = x + image_xscale * 32
            else if (state == states.mach2 || state == states.tackle)
                other.x = x + image_xscale * 20
            break
        case obj_soldier:
            other.x = x + image_xscale * 24
            if (state != states.rage)
                instance_destroy(other)
            break
        case obj_indiancheese:
            if (state != states.walk && sprite_index != spr_indiancheese_howl)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case obj_thug_red:
            if (state != states.punch)
            {
                instance_destroy(other)
                punchinst = -4
            }
            break
        case obj_weeniesquire:
            if (state != states.punch)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case obj_minijohn:
            if (state != states.rage && state != states.punch)
                instance_destroy(other)
            break
        case obj_ninja:
            if (state != 128 && state != states.punch)
                instance_destroy(other)
            if (state == states.punch)
            {
                if (image_index > 14)
                    instance_destroy(other)
                other.x = x + image_xscale * 24
            }
            break
        case obj_snickexe:
            if (obj_player1.instakillmove || obj_player1.state == states.handstandjump)
            {
                instance_destroy(other)
                hitboxcreate = 0
            }
            break
        case obj_pickle:
            if (state != states.Throw)
                instance_destroy(other)
            break
        case obj_peasanto:
        case obj_fencer:
        case obj_snowman:
        case obj_ancho:
            if (state != 128 && state != states.rage)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
    }

}
