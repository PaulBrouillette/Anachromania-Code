/// @desc

//If the player enters the area
if (!alreadyInside) {
	//Check if player is close enough with something to interact
	if (collision_circle(x, y, sprite_width, obj_Player, false, true)) { 
		//If no other textboxes exist 
		if (instance_number(obj_TextBox) == 0) {
			//If they press space
			if (keyboard_check_released(vk_space)) {
				// If player can actually start dialogue
				if (obj_Player.state = states.FREE) {
					//Create it
					alreadyInside = true;
					with (obj_Player) {
						state = states.LOCKED;	
					}
					
					with (obj_BaseNPC) {
						state = states.LOCKED;
						path_speed = 0;
					}
					
					MakeTextbox(textID, id);	
					timer = timermax;
				}	
			}
		}
	}
}

//If the player leaves the area of the SpeakBlock, alreadyInside is false
//Need to think of a way to tweek this, as it's very janky to have to go away
//from the block then come back to it.
if (!collision_circle(x, y, sprite_width, obj_Player, false, true)) {
	alreadyInside = false;	
}

//If the player is locked in place, and no more textboxes are on the screen, this unlocks them after 
//about 1 second
if (!instance_exists(obj_TextBox) && alreadyInside && instance_number(obj_DrawResponseWords) == 0 && instance_number(obj_Inventory) == 0 && !instance_exists(obj_MoveToXY)) {
	
	if (timer > 0) {
		timer -= 1 / room_speed;	
	}
	else {
		alreadyInside = false;
		with (obj_Player) {
			state = states.FREE;	
		}	
		with (obj_BaseNPC) {
			state = states.FREE;	
			path_speed = pathSpeed;
		}
	}
}