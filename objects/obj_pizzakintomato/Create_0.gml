event_inherited()
if (obj_player.character == "P" || obj_player.character != "N")
{
    spr_intro = spr_toppintomato_intro
    spr_idle = spr_toppintomato
    spr_run = spr_toppintomato_run
    spr_panic = spr_toppintomato_panic
}
else if (obj_player.character == "N")
{
    spr_intro = spr_marshm_supertaunt
    spr_idle = spr_marshm_idle
    spr_run = spr_marshm_walk
    spr_panic = spr_marshm_panic
}
spr_intro_strongcold = spr_xmastomatotoppin_intro
spr_idle_strongcold = spr_xmastomatotoppin_idle
spr_run_strongcold = spr_xmastomatotoppin_walk
