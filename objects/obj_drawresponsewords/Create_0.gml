/// @desc

rArray = [];

offset = 11;

selected = noone;

alreadySelected = false;

selectedIndex = 0;

// Appropriate x and y based on viewport to draw text
textX = camera_get_view_x(view_camera[0]) + 30;
textY = camera_get_view_y(view_camera[0]) + 159;

with (obj_Player) {
	state = states.LOCKED;	
}