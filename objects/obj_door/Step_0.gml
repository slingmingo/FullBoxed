if (john && global.panic)
    sprite_index = spr_doorblocked
with (obj_player)
{
    if (place_meeting(x, y, other) && sprite_index == spr_lookdoor)
        x = lerp(x, (other.x + 35), 0.15)
}
