/// @desc
#macro INVENTORY_SLOTS 16
slotSize = INVENTORY_SLOTS;

inventoryX = camera_get_view_x(view_camera[0]) + 32;
inventoryY = camera_get_view_y(view_camera[0]) + 8;

rowLength = 4;
inventory = global.Inventory;
randomize();

draw_set_color(c_black);

text = "";

with (obj_Player) {
	state = states.LOCKED;	
}