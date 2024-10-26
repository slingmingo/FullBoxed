if (!global.pizzadelivery && global.pizzasdelivered < 5 && global.panic == false)
{
    if (!global.failcutscene)
    {
        if (global.pizzasdelivered <= 0)
            scene_info = [[cutscene_set_sprite, 708, 2522, 0.35, -1], [cutscene_gustavo_start], [cutscene_wait, 30], [cutscene_set_sprite, 708, 2246, 0.35, -1], [cutscene_wait, 10], [cutscene_move_player, 409, obj_gustavo.x - 48, 6, 16], [cutscene_set_sprite, 409, 2500, 0.35, 1], [cutscene_set_sprite, 708, 2514, 0.35, -1], [cutscene_gustavo_end]];
        else
            scene_info = [[cutscene_set_sprite, 708, 2513, 0.35, -1]];
    }
    else
    {
        scene_info = [[cutscene_gustavofail_start], [cutscene_wait, 20], [cutscene_set_sprite, 708, 2517, 0.35, -1], [cutscene_waitfor_sprite, 708], [cutscene_set_sprite, 708, 2518, 0.35, -1], [cutscene_wait, 50], [cutscene_set_sprite, 708, 2519, 0.35, -1], [cutscene_set_sprite, 409, 2503, 0.35, 1], [cutscene_waitfor_sprite, 708], [cutscene_set_sprite, 708, 2520, 0.35, -1], [cutscene_set_hsp, 708, -12], [cutscene_set_sprite, 409, 2506, 0.35, 1], [cutscene_waitfor_sprite, 409], [cutscene_set_sprite, 409, 2507, 0.35, 1], [cutscene_check_collision, 708, 409], [cutscene_set_hsp, 708, 0], [cutscene_gustavofail_end, 100], [cutscene_move_actor, 708, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [cutscene_set_sprite, 708, 2513, 0.35, -1]];
    }
}
else
{
    scene_info = [[cutscene_wait, 2]];
}
