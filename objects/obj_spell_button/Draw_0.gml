/// @desc
draw_self();

draw_text_transformed(x, y, associatedSkill.name, .2, .2, image_angle);

if (mouseOver) {
	draw_sprite_stretched(spr_FireMouseOver, drawIndex, x, y, width, height);
	draw_text_transformed(x + width + 10, y, associatedSkill.cost, .2, .2, image_angle);
	drawIndex += .16;
}
else {
	drawIndex = 0;	
}