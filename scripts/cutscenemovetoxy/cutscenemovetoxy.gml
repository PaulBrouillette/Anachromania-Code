// Will move the actor to (targetX, targetY) at walkSpeed.
// Variables are passed into global variables because for whatever reason
// they get funky when I try to pass them back into the obj_MoveToXY.
function CutsceneMoveToXY(actor, targetX, targetY, walkSpeed, endFace){
	global.actor = actor;
	global.XMoveTo = targetX;
	global.YMoveTo = targetY;
	global.cutsceneSpeed = walkSpeed;
	global.endFace = endFace;
	instance_create_depth(0, 0, -10000, obj_MoveToXY);
	with (instance_nearest(0, 0, obj_MoveToXY)) {
		actor = argument[0];
		targetX = argument[1];
		targetY = argument[2];
		walkSpeed = argument[3];
		endFace = argument[4];
		allow = true;
	}	
}