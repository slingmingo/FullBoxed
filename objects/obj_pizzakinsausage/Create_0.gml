event_inherited()
if (obj_player.character == "P" || obj_player.character != "N")
{
    spr_intro = spr_toppinsausage_intro
    spr_idle = spr_toppinsausage
    spr_run = spr_toppinsausage_run
    spr_panic = spr_toppinsausage_panic
}
else if (obj_player.character == "N")
{
    spr_intro = spr_cookie_supertaunt
    spr_idle = spr_cookie_idle
    spr_run = spr_cookie_walk
    spr_panic = spr_cookie_panic
}
spr_intro_strongcold = spr_xmassausagetoppin_intro
spr_idle_strongcold = spr_xmassausagetoppin_idle
spr_run_strongcold = spr_xmassausagetoppin_walk
