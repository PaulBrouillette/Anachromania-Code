/// @desc
// Allow player to move if these objects do not exist
if (!instance_exists(obj_TextBox)) {
	if (!instance_exists(obj_MoveToXY)) {
		if (!instance_exists(obj_Inventory)) {
			with (obj_Player) {
				state = states.FREE;	
			}
		}
	}
}

if (instance_exists(obj_TextBoxQueue)) {
	obj_TextBoxQueue.queueCanGo = true;	
}