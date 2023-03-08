/// @desc
textID = TextID;

pathSpeed = .5;
if (path != noone) {
	path_start(path, pathSpeed, path_action_restart, false);	
}
sprite[RIGHT] = spr_Player_Right;
sprite[UP] = spr_Player_Up;
sprite[LEFT] = spr_Player_Left;
sprite[DOWN] = spr_Player_Down;

face = DOWN;

state = states.FREE;
depth = -bbox_bottom;

//Standins for the built in variables xprevious and yprevious that don't work
//how I want them to. These simply are used to compare last frame's x and y
//with the current x and y to see which direction the NPC is going in to change
//their sprite's direction
previousX = x;
previousY = y;

image_index = 0;

//Make SpeakBlock to follow the NPC around 
mySpeakBlock = instance_create_depth(x, y, 0, obj_SpeakBlock);
mySpeakBlock.textID = textID;
//mySpeakBlock.thisID = id;

step = 0;

walkLeft = 0;
walkRight = 0;
walkUp = 0;
walkDown = 0;
step = 0;
stepFinish = false;