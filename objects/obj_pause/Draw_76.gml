winw = window_get_width()
winh = window_get_height()
apph = min(winh, (winw * 0.5625))
appw = min((apph * 1.7777777777777777), winw)
appx = (winw - appw) / 2
appy = (winh - apph) / 2
appa = 1
