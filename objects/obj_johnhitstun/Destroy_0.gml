with (obj_tv)
    chunkmax = global.fill
with (instance_create(x, y, obj_sausageman_dead))
{
    sprite_index = spr_hungrypillar_dead
    image_xscale = other.image_xscale
}
with (obj_escapecollect)
    image_alpha = 1
with (obj_escapecollectbig)
    image_alpha = 1
instance_activate_object(obj_destroyablebigescape)
instance_activate_object(obj_destroyableescape)
instance_activate_object(obj_metalblockescape)
scr_soundeffect(sfx_escaperumble)
scr_soundeffect(sfx_killenemy)
global.wave = 0
global.maxwave = (global.minutes * 60 + global.seconds) * 60
if global.panicbg
    warbg_init()
var _w = sprite_width / 2
var _h = sprite_height / 2
repeat (8)
{
    var _xrange = random_range((x - _w), (x + _w))
    var _yrange = random_range((y - _h), (y + _h))
}
obj_camera.alarm[1] = 60
instance_create(x, y, obj_bangeffect)
camera_zoom(1, 0.33)
if (global.coop == 1)
{
    obj_player1.x = x
    obj_player2.x = x
    obj_player1.y = y
    obj_player2.y = y
}
with (obj_camera)
{
    shake_mag = 3
    shake_mag_acc = 3 / room_speed
    alarm[6] = 1
}
scr_soundeffect(sfx_killenemy)
global.combo++
global.combotime = 60
scr_soundeffect(sfx_johnpillarimact)
instance_create(x, y, obj_pillarflash)
global.johnblocks = 1
global.panic = 1
if (global.timeattack == 0)
{
    global.minutes = 3
    instance_create(x, (y + 600), obj_itspizzatime)
    global.seconds = 0
    global.fill = 500
}
instance_destroy()
