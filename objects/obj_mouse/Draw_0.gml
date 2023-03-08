/// @desc
if (itemDrag != -1) {
	draw_set_alpha(0.5);
	draw_sprite(spr_Potion, itemDrag, mouse_x - 16, mouse_y - 16);
	draw_set_alpha(1.0);
}
