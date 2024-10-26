if (grounded && other.sprite_index == spr_swordstone && (state == states.spin || state == states.handstandjump || state == states.punch || state == states.lungeattack || state == 276))
{
    transformationlives = 3
    scr_soundeffect(sfx_knightsword)
    global.SAGEknighttaken = 1
    momentum = 0
    movespeed = 0
    other.image_index = 1
    image_index = 0
    image_speed = 0.35
    sprite_index = spr_knightpepstart
    state = states.knightpep
    hsp = 0
    vsp = 0
}
