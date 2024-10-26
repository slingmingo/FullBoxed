draw_set_font(global.creditsfont)
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_alpha(1)
if four
{
    draw_sprite_tiled(bg_credits3, 0, x, (y + scroll / 2.15))
    draw_sprite_tiled(bg_credits2, 0, x, (y + scroll / 1.75))
    draw_sprite_tiled_ext(bg_credits, 0, x, (y + scroll / 1.5), 1, 1, c_white, 0.5)
    draw_sprite(spr_title, 0, 475, (310 + scroll))
    draw_text(485, (475 + scroll), "A Mod by Mr.Crabapples")
    draw_sprite(spr_crabcreditsicon, imindex, 475, (575 + scroll))
    draw_text(485, (750 + scroll), "Sprite Work by GuyTheMind & Dezookits")
    draw_sprite(spr_guycreditsicon, imindex, 250, (860 + scroll))
    draw_sprite(spr_decreditsicon, imindex, 675, (860 + scroll))
    draw_text(485, (1000 + scroll), "Music Composition by Dezookits, Damian & \nHotelmariolover")
    draw_sprite(spr_decreditsicon, imindex, 250, (1150 + scroll))
    draw_sprite(spr_hotelcreditsicon, imindex, 675, (1125 + scroll))
    draw_sprite(spr_damiancreditsicon, imindex, 475, (1145 + scroll))
    draw_text(485, (1250 + scroll), "Programming by Mr.Crabpples & nHotelmariolover")
    draw_sprite(spr_crabcreditsicon, imindex, 250, (1355 + scroll))
    draw_sprite(spr_hotelcreditsicon, imindex, 675, (1355 + scroll))
    draw_text(485, (1505 + scroll), "Thanks olivier (shroom / salmon) for making\n the new Sausage Toppin TV")
    draw_set_color(c_yellow)
    draw_text(485, (1600 + scroll), "Special Thanks to:")
    draw_sprite(spr_ebacreditsicon, imindex, 100, (1600 + scroll))
    draw_sprite(spr_hooverscreditsicon, imindex, 850, (1600 + scroll))
    draw_sprite(spr_poponcreditsicon, imindex, 100, (1750 + scroll))
    draw_sprite(spr_honeycreditsicon, imindex, 850, (1750 + scroll))
    draw_sprite(spr_vibcreditsicon, imindex, 100, (1850 + scroll))
    draw_sprite(spr_coinmancreditsicon, imindex, 850, (1850 + scroll))
    draw_text(485, (1750 + scroll), "EricIsACoolerPerson   HooversHour\n PoponTheBozo   NimbusVibus\n loziffe	   Keyaan\n and honeyclown\nFor your support and kindness during\nthe production of this demo!")
    draw_set_color(c_white)
    draw_text(485, (1975 + scroll), "And thanks to all of the members of the\n Pizza Tower Meta Discord! \n this mod would not be where\n it is without your support!")
    draw_text_color(485, 270, "Goodbye Now!", c_white, c_white, c_white, c_white, fade2)
}
if one
    draw_text(485, (95 + scroll), "Thank you")
if two
    draw_text(485, (135 + scroll), "For Playing")
if (three && four == 0)
    draw_sprite(spr_titlewhite, 0, 475, (310 + scroll))
if four
    draw_sprite_ext(spr_pixel, 0, 0, 0, 960, 540, 0, c_white, flash)
draw_sprite_ext(spr_pixel, 0, 0, 0, 960, 540, 0, c_black, fade)
if popup
    draw_text(750, 500, "Press jump again to exit.")
