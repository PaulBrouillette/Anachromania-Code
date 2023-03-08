/// @desc

switch (state) {
	//When the player is able to move around based on user input from keys
	case states.FREE :
		//Get inputs of arrow keys
		right_key = keyboard_check(vk_right);
		left_key = keyboard_check(vk_left);
		up_key = keyboard_check(vk_up);
		down_key = keyboard_check(vk_down);	
		//Call movement script and move as appropriate
		PlayerMove();
		
		// Open menu, if you can
		if (keyboard_check_released(ord("M"))) {
			if (!instance_exists(obj_Inventory)) {
				instance_create_depth(0, 0, -9999, obj_Mouse);
				instance_create_depth(80, 44, -9998, obj_Inventory);
				state = states.LOCKED;
			}
		}
		break;
		
	//Used for when player is interacting with NPC, in a cutscene, in a battle, etc.
	//Used during the player should not be able to move freely from player input
	case states.LOCKED :
		if (animatable) {
			PlayerMove();	
		}
		else {
			image_index = 0;
		}
		
		break;
}

//Used to make depth of objects appear correctly
depth = -bbox_bottom;

previousX = x;
previousY = y;

