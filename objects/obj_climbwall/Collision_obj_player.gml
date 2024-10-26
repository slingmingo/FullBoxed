with (other)
{
    if (key_up && ladderbuffer == 0 && (state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.shotgunjump || state == states.jump || state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
        state = states.ladder
    if (key_up && ladderbuffer == 0 && (state == states.ratmountjump || state == states.ratmount))
    {
        state = states.ratmountladder
        if (movespeed > 10)
            sprite_index = spr_player_hangslide
        if (brick == 1)
        {
            with (instance_create(x, y, obj_brickcomeback))
            {
                wait = 1
                instance_create(x, y, obj_genericpoofeffect)
            }
        }
        brick = 0
    }
}
