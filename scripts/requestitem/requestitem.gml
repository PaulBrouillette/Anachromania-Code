function RequestItem(recipientID){
	itemRequest = {
		recieverID : argument[0],
		
		toString : function() {
			return string("ItemRequest");
		}
	};
	
	with (instance_nearest(0, 0, obj_TextBoxQueue)) {
		ds_queue_enqueue(textQueue, other.itemRequest);
	}
}