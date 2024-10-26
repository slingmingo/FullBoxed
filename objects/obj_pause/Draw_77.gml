application_surface_draw_enable(0)
gpu_set_colorwriteenable(1, 1, 1, 0)
draw_surface_ext(application_surface, appx, appy, (appw / surface_get_width(application_surface)), (apph / surface_get_height(application_surface)), 0, c_white, appa)
gpu_set_colorwriteenable(1, 1, 1, 1)
