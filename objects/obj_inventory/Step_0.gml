/// @desc
if (keyboard_check_released(ord("M"))) {
	if (obj_Mouse.itemDrag != 1) {
		instance_destroy(obj_Inventory);
		instance_destroy(obj_Mouse);
	}
}

