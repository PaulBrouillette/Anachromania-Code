/// @desc Get rid of the ds_queue
if (ds_exists(textQueue, ds_type_queue)) {
	ds_queue_destroy(textQueue);	
}