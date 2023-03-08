/// @desc If no more dialogue, destroy this and the textbox
if (currentIndex >= array_length(textArray)) {
	instance_destroy();
}

// If a dialogue box does not exist but words do, make a dialogue box
if (instance_number(obj_TextBox) == 0) {
	instance_create_depth(0, 0, -9999, obj_TextBox);
}