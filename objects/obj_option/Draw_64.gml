draw_sprite_tiled_ext(bg_options01, 0, bgxscroll, bgyscroll, 1, 1, make_color_rgb(65, 25, 125), 1)
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
var _os = optionselected
var _os_fs = optionsaved_fullscreen
draw_sprite(spr_introasset9, 0, 280, 0)
draw_text_colour(280, (-55 + yoffset), "GENERAL CONFIGURATION", c_white, c_white, c_white, c_white, 1)
draw_set_font(global.smallfont)
draw_text_colour(810, 32, "PRESS ESCAPE TO CLOSE", c_white, c_white, c_white, c_white, 1)
draw_text_colour(280, (-15 + yoffset), "THIS MENU WILL BE GETTING\nA FULL REWORK SOON!", c_red, c_red, c_red, c_red, 1)
draw_set_font(global.bigfont)
draw_text_colour(280, (35 + yoffset), "FULLSCREEN", gbc, gbc, gbc, gbc, (_os == 0 ? 1 : 0.5))
draw_text_colour(180, (75 + yoffset), "ON", gbc, gbc, gbc, gbc, (_os_fs == 0 ? 1 : 0.5))
draw_text_colour(380, (75 + yoffset), "OFF", gbc, gbc, gbc, gbc, (_os_fs == 1 ? 1 : 0.5))
var _os_vb = optionsaved_vibration
draw_text_colour(280, (200 + yoffset), "CONTROLLER VIBRATION", gbc, gbc, gbc, gbc, (_os == 2 ? 1 : 0.5))
draw_text_colour(180, (240 + yoffset), "ON", gbc, gbc, gbc, gbc, (_os_vb == 0 ? 1 : 0.5))
draw_text_colour(380, (240 + yoffset), "OFF", gbc, gbc, gbc, gbc, (_os_vb == 1 ? 1 : 0.5))
var _os_rs = optionsaved_resolution
draw_text_colour(280, (115 + yoffset), "RESOLUTION", gbc, gbc, gbc, gbc, (_os == 1 ? 1 : 0.5))
draw_text_colour(100, (150 + yoffset), concat(480, "X", 270), gbc, gbc, gbc, gbc, (_os_rs == 0 ? 1 : 0.5))
draw_text_colour(280, (150 + yoffset), concat(960, "X", 540), gbc, gbc, gbc, gbc, (_os_rs == 1 ? 1 : 0.5))
draw_text_colour(480, (150 + yoffset), concat(1920, "X", 1080), gbc, gbc, gbc, gbc, (_os_rs == 2 ? 1 : 0.5))
draw_text_colour(280, (375 + yoffset), "KEY BINDINGS", make_color_rgb(255, 25, 215), make_color_rgb(255, 25, 215), make_color_rgb(255, 25, 215), make_color_rgb(255, 25, 215), (_os == 4 ? 1 : 0.5))
draw_text_colour(280, (425 + yoffset), "AUDIO SETTINGS", make_color_rgb(255, 200, 0), make_color_rgb(255, 200, 0), make_color_rgb(255, 200, 0), make_color_rgb(255, 200, 0), (_os == 5 ? 1 : 0.5))
var _os_ce = optionsaved_cameraeffects
draw_text_colour(280, (290 + yoffset), "CAMERA EFFECTS", gbc, gbc, gbc, gbc, (_os == 3 ? 1 : 0.5))
draw_text_colour(180, (325 + yoffset), "ON", gbc, gbc, gbc, gbc, (_os_vb == 0 ? 1 : 0.5))
draw_text_colour(380, (325 + yoffset), "OFF", gbc, gbc, gbc, gbc, (_os_vb == 1 ? 1 : 0.5))
