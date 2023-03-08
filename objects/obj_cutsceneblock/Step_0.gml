/// @desc

if (allow) {
	if (place_meeting(x, y, obj_Player)) {
		allow = false;
		MakeTextbox(textID, thisID);	
		if (oneTimeInteraction) {
			ChangeManagerVariable(managerScriptID);
			instance_destroy();	
		}
		with (obj_Player) {
			state = states.LOCKED;
		}
		with (obj_BaseNPC) {
			state = states.LOCKED;	
		}
		timer = timermax;
	}
}

if (instance_number(obj_TextBox) == 0) {
	if (timer > 0) {
		timer -= 1 / room_speed;	
	}
	else {
		allow = true;
	}
}

//Special cases where if a player goes past a certain x or y position, the instance will destroy itself
if (destroyAfterPlayerX != noone) {
	if (obj_Player.x == destroyAfterPlayerX) {
		ChangeManagerVariable(managerScriptID);
		instance_destroy();	
	}
}

if (destroyAfterPlayerY != noone) {
	if (obj_Player.y == destroyAfterPlayerY) {
		ChangeManagerVariable(managerScriptID);
		instance_destroy();	
	}
}