event_inherited()
image_alpha = 1
if (obj_player.character == "P" || obj_player.character != "N")
{
    spr_intro = spr_toppinshroom_intro
    spr_idle = spr_toppinshroom
    spr_run = spr_toppinshroom_run
    spr_panic = spr_toppinshroom_panic
}
else if (obj_player.character == "N")
{
    spr_intro = spr_bean_supertaunt
    spr_idle = spr_bean_idle
    spr_run = spr_bean_walk
    spr_panic = spr_bean_panic
}
spr_intro_strongcold = spr_xmasshroomtoppin_intro
spr_idle_strongcold = spr_xmasshroomtoppin_idle
spr_run_strongcold = spr_xmasshroomtoppin_walk
