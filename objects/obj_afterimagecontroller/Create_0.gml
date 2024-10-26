depth = 1
global.afterimage_list = ds_list_create()
alpha = array_create(7, 1)
alpha[2] = 0.5
shd_alpha = shader_get_uniform(shd_firemouth_afterimage, "newAlpha")
