/// @desc
switch (state) {
	//NPC can freely follow a path or move in a cutscene
	case states.FREE:
		if (x != previousX || y != previousY) {
			NPCAnimate();	
		}
		else {
			image_index = 0;	
		}
		
		break;
	//NPC is locked in place and should stop animating
	case states.LOCKED:
		image_index = 0;
		path_speed = 0;
		break;
}
//Adjust NPC's previous x and y
previousX = x;
previousY = y;

//During a cutscene, this is how the NPC moves
if (step != 0) {
	step--;
	x += walkLeft + walkRight;
	y += walkUp + walkDown;
	if (step == 1) {
		stepFinish = true;	
	}
}

if (stepFinish) {
	stepFinish = false;
	walkLeft = 0;
	walkRight = 0;
	walkUp = 0;
	walkDown = 0;	
	image_index = 0;
	with (obj_Player) {
		state = states.FREE;
	}
}

//Free the NPC from any cutscene or whatnot as long as a textbox isn't present
if (instance_number(obj_TextBox) == 0) {
	//state = states.FREE;	
}

depth = -bbox_bottom;