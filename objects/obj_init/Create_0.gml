global.showcollisions = false
global.showhitboxes = false
global.panic = 0
global.panicbg = 1
global.johnblocks = 0
global.timeattack = 0
global.dashenabled = 0
global.swapmode = 0
global.superactive = 0
global.hasfoughtboss1 = 0
global.pal1 = 1
global.pal2 = 1
global.wave = 0
global.maxwave = 0
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.$1234567890:", 1, 0)
global.lapfont = font_add_sprite_ext(spr_lapfont, "0123456789", 1, 0)
global.tutorialfont = font_add_sprite_ext(spr_tutorialfont_0, "'?-LMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:0123456789ABCDEFGHIJK", 1, 2)
global.collectfont = font_add_sprite_ext(spr_font_collect, "0123456789", 1, 0)
global.combofont = font_add_sprite_ext(spr_font_combo, "0123456789/:", 1, 0)
global.combofont2 = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", 1, 0)
global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!.$_:?1234567890", 1, 0)
global.wartimerfont1 = font_add_sprite_ext(spr_wartimer_font1, "1234567890", 1, 0)
global.wartimerfont2 = font_add_sprite_ext(spr_wartimer_font2, "1234567890", 1, 0)
global.creditsfont = font_add_sprite_ext(spr_creditsfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"_-[]▼()&#*", true, 2)
audio_group_load(1)
scr_toggleablegameoptions()
window_set_showborder(true)
