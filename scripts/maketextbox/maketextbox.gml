function MakeTextbox(textID, _id){
	instance_create_depth(0, 0, -9999, obj_TextBox);
	FindDialogueOrAction(textID, _id);
}