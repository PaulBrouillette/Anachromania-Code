/// Destroy block if and when it's over a key
	
	//Check if there are even any blocks on screen
	if (instance_number(obj_Block) > 0) {
		if (keyboard_check_pressed(ord(Key))) {
			image_index = 1;	
			//Get closest block
			inst = instance_nearest(x, y, obj_Block);
			//If block is over key, make sure that that block and key match up
			if (inst.breakable && x == inst.x) {
				instance_destroy(inst);
				global.successfulHits--;		
			}
			//If not,
			else {
				global.successfulHits++;	
			}
		}
		else {
			image_index = 0;	
		}
	}