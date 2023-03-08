/// @desc During dialogue or cutscenes, prepares to go to the battle room
if (instance_number(obj_Textbox) == 0) {
	with (obj_Player) {
		visible = false;
		state = states.LOCKED;
	}
	room_goto(room_BattleRoom);
	global.previousRoom = room;
	instance_destroy();
}
