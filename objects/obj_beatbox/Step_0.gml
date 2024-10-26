if (obj_player1.sprite_index != obj_player.spr_breakdance)
{
    instance_create(x, y, obj_genericpoofeffect)
    instance_destroy()
}
scr_collision()
