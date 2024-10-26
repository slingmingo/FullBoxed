if (phase2 == 0)
{
    image_speed = 0.4
    image_index = 0
    instance_create((x - 250), y, obj_pizzamancerflight)
    scr_soundeffect(sfx_dragonhit)
    scr_soundeffect(sfx_escaperumble)
    layer_set_visible(layer_get_id("P21"), true)
    layer_set_visible(layer_get_id("P22"), true)
    layer_set_visible(layer_get_id("P23"), true)
    layer_set_visible(layer_get_id("P24"), true)
    obj_drawcontroller.superattacking = 0
    obj_bosscontroller.bosshp = 10
    instance_create(x, y, obj_pizzamancer)
    phase2 = 1
    audio_stop_sound(mu_dragonlair)
    scr_music(mu_dragonphase2)
    instance_create(0, 0, obj_flash)
    with (obj_player)
    {
        x = 213
        y = 432
        state = states.normal
        sprite_index = spr_idle
        xscale = 1
    }
    x = 672
    y = 352
    sprite_index = spr_cheesedragon_2intro1
}
