/// @desc A textbox to be displayed on screen
draw_set_font(global.textboxFont);

// Appropriate x and y to draw textbox based on viewport
textBoxX = camera_get_view_x(view_camera[0]);
textBoxY = camera_get_view_y(view_camera[0]) + 151;

with (obj_Player) {
	state = states.LOCKED;
}