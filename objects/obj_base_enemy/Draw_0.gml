draw_self();
image_xscale = global.enemyBattleScale;
image_yscale = global.enemyBattleScale;
draw_set_font(font_Medieval);
draw_text_transformed(x, y + 20, current[@HEALTH], .3, .3, image_angle);

if (drawTarget) {
	var _cur_halign = draw_get_halign();
	draw_set_halign(fa_center);
	draw_text_ext_transformed(x + sprite_width / 2, y - 30, talker, 55, 500, .2, .2, image_angle);
	draw_set_halign(_cur_halign);
}