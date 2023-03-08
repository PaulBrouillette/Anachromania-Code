function DrawTextboxDialogue(array, cPortrait, response){
	_array = argument[0];
	_portrait = argument[1];
	_responses = argument[2];
	
	//// If no obj_TextBoxWords are in existance, make one
	//if !(instance_exists(obj_TextBoxWords) && !instance_exists(obj_Inventory) && !instance_exists(obj_MoveToXY) && !instance_exists(obj_DrawResponseWords)) {
	//	instance_create_depth(0, 0, -10000, obj_TextBoxWords) 
	//	with (instance_nearest(0, 0, obj_TextBoxWords)) {	
	//		textArray = other._array;
	//		portrait = other._portrait;
	//		responses = other._responses;
	//	}	
	//}
	//// If there is, put the remaining ones into the queue object as a struct
	//else {
		text = {
				tArray : _array,
				characterPortrait : _portrait,
				tResponses : _responses,
			
				toString : function() {
					return string("TextBox")
				}
			};
		with (instance_nearest(0, 0, obj_TextBoxQueue)) {
			ds_queue_enqueue(textQueue, other.text);
		}
	}
//}