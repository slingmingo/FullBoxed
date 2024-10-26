event_inherited()
if (obj_player.character == "P" || obj_player.character != "N")
{
    spr_intro = spr_toppincheese_intro
    spr_idle = spr_toppincheese
    spr_run = spr_toppincheese_run
    spr_panic = spr_toppincheese_panic
}
else if (obj_player.character == "N")
{
    spr_intro = spr_pop_supertaunt
    spr_idle = spr_pop_idle
    spr_run = spr_pop_walk
    spr_panic = spr_pop_panic
}
spr_intro_strongcold = spr_xmascheesetoppin_intro
spr_idle_strongcold = spr_xmascheesetoppin_idle
spr_run_strongcold = spr_xmascheesetoppin_walk
