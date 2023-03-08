/// @desc

//draw_self();
if (instance_number(obj_Block) == 0 && i == global.totalPossibleHits) {
	if (global.successfulHits < 0) {
		global.successfulHits = 0;	
	}
	
	with (global.selectedUnit) {
		state = ATTACK_STATE;	
	}
	with (obj_Key) {
		image_index = 0;	
	}
	instance_destroy();
}

