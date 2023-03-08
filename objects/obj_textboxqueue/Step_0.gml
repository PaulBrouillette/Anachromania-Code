/// @desc If the current action is over, dequeue new action

// ********************************
// ADD !instance_exists(whatever the name of responses object is)
// ********************************

// If at least one instance of obj_DrawResponseWords already exists, and the next
// thing in the queue is an obj_DrawResponseWords, keep dequeuing because those
// objects can stack


// _id is the next thing in the queue
_id = ds_queue_head(textQueue);
		

// Wait for these, since they can't go at the same time
if (queueCanGo) {
	// If a textbox words object does not exist and _id is supposed to be one, dequeue it
	if (_id.toString() == "TextBox") {
		//if (!instance_exists(obj_Inventory) && !instance_exists(obj_DrawResponseWords) && !instance_exists(obj_TextBoxWords) && !instance_exists(obj_MoveToXY)) {
			queueCanGo = false;
			_id = ds_queue_dequeue(textQueue);
			instance_create_depth(0, 0, -10000, obj_TextBoxWords) 
			with (instance_nearest(0, 0, obj_TextBoxWords)) {	
				textArray = other._id.tArray;
				portrait = other._id.characterPortrait;
				responses = other._id.tResponses;
			}
		//}
	}


	// If a cutscene move object does not exist and _id is supposed to be one, dequeue it
	else if (_id.toString() == "Action") {
		//if (!instance_exists(obj_Inventory) && !instance_exists(obj_DrawResponseWords) && !instance_exists(obj_TextBoxWords) && !instance_exists(obj_MoveToXY)) {
			queueCanGo = false;
			_id = ds_queue_dequeue(textQueue);
			CutsceneMoveToXY(_id.actor, _id.targetX, _id.targetY, _id.walkSpeed, _id.endFace);	
		//}
	}

	// Item request
	else if (_id.toString() == "ItemRequest") {
		//if (!instance_exists(obj_Inventory) && !instance_exists(obj_DrawResponseWords) && !instance_exists(obj_TextBoxWords) && !instance_exists(obj_MoveToXY)) {
			queueCanGo = false;
			_id = ds_queue_dequeue(textQueue);
			instance_create_depth(0, 0, -9999, obj_Mouse);
			instance_create_depth(80, 44, -9998, obj_Inventory);
				
			with (instance_create_depth(0, 0, -9998, obj_Inventory)) {
				slotSize = 1;
				inventoryX = camera_get_view_x(view_camera[0]);
				inventoryY = camera_get_view_y(view_camera[0]) + 168;
				rowLength = 1;
				inventory = array_create(1, -1);
			}
		//}	
	}

	// Responses
	// These can stack so if one already exists, keep dequeuing
	else if (_id.toString() == "Responses") {
		_id = ds_queue_dequeue(textQueue);
		DrawResponses(_id.response, _id.responseTextID);
	}


	// Sprite changes
	// Like responses, can be independently queued because they don't have
	// to wait for anything
	else if (_id.toString() == "SpriteChange") {
		queueCanGo = false;
		_id = ds_queue_dequeue(textQueue);
		_id.actor.sprite_index = _id.newSprite;
		queueCanGo = true;
	}

	// Something went wrong with a struct, son
	else {
		show_debug_message("You dun goofed");	
	}
}

//if (!instance_exists(obj_TextBoxWords) && !instance_exists(obj_MoveToXY) && !instance_exists(obj_Inventory)) {
//	_id = ds_queue_dequeue(textQueue);
	
//	if (instance_exists(obj_DrawResponseWords)) {
		
//		DrawResponses(_id.response, _id.responseTextID);	
//		delete _id;
//	}
//	else {	
		
//		// If next thing in queue is a textbox, make an obj_TextBoxWords
//		if (_id.toString() == "TextBox") {
//			DrawTextboxDialogue(_id.tArray, _id.characterPortrait, _id.tResponses);		
//		}
//		// If next is an action, make an obj_MoveToXY
//		else if (_id.toString() == "Action") {
			
//			CutsceneMoveToXY(_id.actor, _id.targetX, _id.targetY, _id.walkSpeed, _id.endFace);	
//		}
//		// If next is a response, make an obj_DrawResponseWords
//		// Note: If I decide that something else should be queued here, make this an else if
//		else if (_id.toString() == "Responses") {
//			DrawResponses(_id.response, _id.responseTextID);
//		}
//		else if (_id.toString() == "ItemRequest") {
//			instance_create_depth(0, 0, -9999, obj_Mouse);
//			instance_create_depth(80, 44, -9998, obj_Inventory);
				
//			with (instance_create_depth(0, 0, -9998, obj_Inventory)) {
//				slotSize = 1;
//				inventoryX = camera_get_view_x(view_camera[0]);
//				inventoryY = camera_get_view_y(view_camera[0]) + 168;
//				rowLength = 1;
//				inventory = array_create(1, -1);
//			}
//		}
//		else if (_id.toString() == "SpriteChange") {
//			_id.actor.sprite_index = _id.newSprite;
			
//		}
//		else {
//			show_debug_message("wtf");	
//		}
//		delete _id;	
//	}
//}

if (ds_queue_size(textQueue) == 0) {
	instance_destroy();
}