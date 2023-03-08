/// @desc Moves the actor to a specified (x, y)
// It moves them to the x position first, then to the y
// For example, if an actor is at (410, 500) and they want
// to move to (100, 100), they first get moved on the x axis to
// (100, 500). Then, they move to (100, 100). 
xMove = false;
yMove = false;
stopMove = false;

allow = false;

actor = global.actor;
walkSpeed = global.cutsceneSpeed;
targetX = global.XMoveTo;
targetY = global.YMoveTo;
endFace = global.endFace;
actor.animatable = true;

xMove = true;

with (obj_Player) {
	state = states.LOCKED;	
}