// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerMove(){
	//Calculate direction
	//If pressing the right key, it is 1. If not pressing the left key, it is 0.
	//1 - 0 = 1, so 1 pixel in the positive x direction every frame
	xSpeed = (right_key - left_key) * moveSpeed;
	ySpeed = (down_key - up_key) * moveSpeed;
	
	if (state = states.LOCKED) {
		xSpeed = 0;
		ySpeed = 0;
	}

	//Pause
	if (instance_exists(obj_Pauser)) {
		xSpeed = 0;
		ySpeed = 0;
	}

	//Set sprite direction
	mask_index = sprite[DOWN];
	if (ySpeed == 0) {
		if (xSpeed > 0) {
		face = RIGHT;	
		}
		if (xSpeed < 0) {
			face = LEFT;	
		}	
	}
	if (xSpeed > 0 && face == LEFT) {
		face = RIGHT;
	}	
	if (xSpeed < 0 && face == RIGHT) {
		face = LEFT;
	}

	if (xSpeed == 0) {
		if (ySpeed > 0) {
			face = DOWN;	
		}
		if (ySpeed < 0) {
			face = UP;	
		}		
	}
	if (ySpeed > 0 && face == UP) {
		face = DOWN;
	}
	if (ySpeed < 0 && face == DOWN) {
		face = UP;
	}
	
	if (x > previousX) {
		face = RIGHT;	
		xSpeed = 1;
	}
	// If not being controlled by arrow keys, determines what direction the player is moving in
	// based on where they were last frame compared to the current frame.
	//Moving left!
	if (previousX > x) {
		face = LEFT;	
		xSpeed = -1;
	}
	//Moving up!
	if (y < previousY) {
		face = UP;
		ySpeed = -1;
	}
	//Moving down!
	if (y > previousY) {
		face = DOWN;
		ySpeed = 1;
	}
	
	mask_index = sprite[DOWN];
	sprite_index = sprite[face];

	//Collisions
	if (place_meeting(x + xSpeed, y, obj_Wall)) {
		xSpeed = 0;	
	}
	if (place_meeting(x, y + ySpeed, obj_Wall)) {
		ySpeed = 0;	
	}
	if (place_meeting(x + xSpeed, y, obj_BaseNPC)) {
		xSpeed = 0;	
	}
	if (place_meeting(x, y + ySpeed, obj_BaseNPC)) {
		ySpeed = 0;	
	}

	//Move
	x += xSpeed;
	y += ySpeed;	


	//Animate 
	if (xSpeed == 0 && ySpeed == 0) {
		image_index = 0;	
	}
	if (animatable) {
		image_index += .0125;	
	}
}