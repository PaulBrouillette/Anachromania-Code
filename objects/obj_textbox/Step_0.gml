/// @desc If no more text, destroy it

if (instance_number(obj_TextBoxWords) == 0) {
	// If no more cutscene moving or responses, make player able to move
	
	instance_destroy();
}