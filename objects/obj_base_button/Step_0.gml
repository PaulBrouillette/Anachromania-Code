if (buttonState = ButtonState.ACTIVE) {
	//text = buttonText;
	image_alpha = 1;
	if (MainFunction != noone && position_meeting(mouse_x, mouse_y, id)) {
		image_index = 1;
		if (obj_BattleManager.allowInput && mouse_check_button_released(mb_left)) {
			script_execute(MainFunction);	
			image_index = 0;
			//text = buttonText;
		}
	}
	else {
		image_index = 0;	
	}
}
else {
	image_alpha = 0;
}