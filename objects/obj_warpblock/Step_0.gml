/// @desc
if (place_meeting(x, y, obj_Player) && !instance_exists(obj_WarpAnimation)) {
	var inst = instance_create_depth(0, 0, -9999, obj_WarpAnimation);
	inst.targetX = targetX;
	inst.targetY = targetY;
	inst.targetRoom = targetRoom;
	inst.targetFace = targetFace;
}
