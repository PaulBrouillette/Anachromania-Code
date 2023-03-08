// Wait for _time amount of seconds (roughly). Functions similarly to the Move function
// except this one exclusively uses obj_Walker to move. Simulates "waiting", as the invisible
// obj_Walker moves to a location and everything else in the queue waits for it to finish
function Wait(_time){
	// _time of .25 is about .5 seconds
	// _time of .5 is about 1 second
	// _time of 1 is about 2 seconds 
	// _time of 2 is about 3.5 seconds
	
	
	// Determine Walker's new targetX
	// Walker only moves on the x axis, he spawns in at (0, 0)
	totalDistance = (100 * argument[0]);
	
	actions = {
		actor : obj_Walker,
		targetX : totalDistance + obj_Walker.goingToX,
		targetY : y,
		walkSpeed : 1,
		endFace : UP,
				
		toString : function() {
			return string("Action");
		}
	
				
	};
	obj_Walker.goingToX += totalDistance;
	
	with (instance_nearest(0, 0, obj_TextBoxQueue)) {
		ds_queue_enqueue(textQueue, other.actions);
	}
	show_debug_message(actions.targetX);
}