/// @desc A place where textbox text is queued
with (obj_Player) {
	state = states.LOCKED;	
}
textQueue = ds_queue_create();

// Determines if the queue can be dequeued at a given time. Set to false
// when an object, a textbox or moving object for example are created, when
// those are destroyed, this gets set back to true
queueCanGo = true;