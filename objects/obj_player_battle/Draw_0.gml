///// @desc
//draw_self();
//var h = current[@HEALTH] / base[@HEALTH] * 100;
//var s = current[@SKILLPOINTS] / base[@SKILLPOINTS] * 100;
//var _cur_halign = draw_get_halign();
//var _cur_valign = draw_get_valign();
//draw_set_halign(fa_center);

//draw_text_transformed(x + (sprite_width / 2), y - 5, name, .4, .4, image_angle);
//draw_healthbar(x + 5, y + 30, x + (sprite_width - 5), y + 50, h, bgColor, c_black, healthColor, 0, true, true);
//draw_healthbar(x + 5, y + 60, x + (sprite_width - 5), y + 80, s, bgColor, c_black, skillColor, 0, true, true);
//draw_set_valign(fa_center);
//draw_set_color(c_white);
//draw_text_transformed(x + (sprite_width / 2), y + 39, string(current[@HEALTH]) + "/" + string(base[@HEALTH]), .3, .3, image_angle);
//draw_text_transformed(x + (sprite_width / 2), y + 69, string(current[@SKILLPOINTS]) + "/" + string(base[@SKILLPOINTS]), .3, .3, image_angle);
//draw_set_halign(_cur_halign);
//draw_set_valign(_cur_valign);
//draw_set_color(c_black);

//if (selected) {
//	image_index = 1;	
//}
//else {
//	image_index = 0;	
//}