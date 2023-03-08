/// @desc Store inventory somewhere safe
if (slotSize == 16) {
	global.Inventory = inventory;		
}
else if (slotSize == 1) {
	// I just did a item exhange, if inventory[i] == -1, no item
	// was exchanged, else it's something. Either way, MakeTextbox(global.ItemRecipient)
	itemGot = string(inventory[0]);
	global.ItemRecipient += itemGot;
	FindDialogueOrAction(global.ItemRecipient, id);
	global.ItemRecipient = "";
}

// Allow player to move if these objects do not exist
if (!instance_exists(obj_TextBox)) {
	if (!instance_exists(obj_MoveToXY)) {
		if (!instance_exists(obj_DrawResponseWords)) {
			with (obj_Player) {
				state = states.FREE;	
			}
		}
	}
}

if (instance_exists(obj_TextBoxQueue)) {
	obj_TextBoxQueue.queueCanGo = true;	
}


