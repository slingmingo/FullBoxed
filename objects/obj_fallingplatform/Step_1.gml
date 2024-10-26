if (visible == true)
{
    hsp = round(lengthdir_x((moveSpeed - stopSpeed), targetDirection))
    vsp = round(lengthdir_y((moveSpeed - stopSpeed), targetDirection))
    trueX += hsp
    trueY += vsp
    x = round(trueX)
    y = round(trueY)
}
if (place_meeting((x + sign(hsp)), (y + sign(vsp)), obj_movingplatformnewtrigger) && stopped == false)
{
    with (instance_place((x + sign(hsp)), (y + sign(vsp)), obj_movingplatformnewtrigger))
    {
        if (other.stopid != id)
        {
            other.platformDirection = targetAngle
            other.stopped = true
            other.stopid = id
        }
    }
}
if (stopped == true)
{
    stopSpeed = approach(stopSpeed, stopSpeedMax, stopSpeedAcc)
    if (stopSpeed >= stopSpeedMax)
    {
        targetDirection = platformDirection
        stopped = false
    }
}
else
    stopSpeed = approach(stopSpeed, 0, stopSpeedDecc)
if (place_meeting(x, (y - 4), obj_player) && obj_player.grounded)
    falling = 1
if (falling == 1)
{
    falltime--
    sprite_index = spr_fallingchicagofall
}
if (falltime == 0)
{
    vsp = 0
    hsp = 0
    with (instance_create(x, y, obj_sausageman_dead))
    {
        sprite_index = spr_fallingchicagofall
        angle = 0
        spinspeed = 0
        hsp = 0
        vsp = -6
    }
    if place_meeting(trueX, (trueY - 4), obj_player)
    {
        obj_player.y -= 2
        obj_player.grounded = false
    }
    visible = false
    mask_index = spr_null
    obj_player.onMovingPlatform = -4
    respawntimer = 120
}
if (respawntimer > 0)
    respawntimer--
if (respawntimer == 0 && visible == false)
{
    trueX = xstart
    trueY = ystart
    visible = true
    mask_index = spr_fallingchigaco
    falling = 0
    falltime = 30
    hsp = 0
    vsp = 0
    sprite_index = spr_fallingchigaco
    instance_create(x, y, obj_genericpoofeffect)
}
