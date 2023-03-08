/// @desc
if (instance_number(obj_Textbox) == 0) {
	CutsceneMove(thisID, _direction, distance, DOWN);
	instance_destroy();
}