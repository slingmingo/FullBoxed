event_inherited()
if (obj_player.character == "P" || obj_player.character != "N")
{
    spr_intro = spr_toppinpineapple_intro
    spr_idle = spr_toppinpineapple
    spr_run = spr_toppinpineapple_run
    spr_panic = spr_toppinpineapple_panic
}
else if (obj_player.character == "N")
{
    spr_intro = spr_ccorn_supertaunt
    spr_idle = spr_ccorn_idle
    spr_run = spr_ccorn_walk
    spr_panic = spr_ccorn_panic
}
spr_intro_strongcold = spr_xmaspineappletoppin_intro
spr_idle_strongcold = spr_xmaspineappletoppin_idle
spr_run_strongcold = spr_xmaspineappletoppin_walk
