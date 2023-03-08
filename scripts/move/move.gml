// Move an actor to a specified position, (_targetX, _targetY) at a distance of _walkSpeed.
// The direction they face when they end is _endFace
function Move(_actor, _targetX, _targetY, _walkSpeed, _endFace){
	
	actions = {
		actor : argument[0],
		targetX :argument[1],
		targetY : argument[2],
		walkSpeed : argument[3],
		endFace : argument[4],
				
		toString : function() {
			return string("Action");
		}
				
	};
	with (instance_nearest(0, 0, obj_TextBoxQueue)) {
		ds_queue_enqueue(textQueue, other.actions);
	}
}