/// @desc
if (index == 0) {
	index++;	
	width = string_width(associatedSkill.name) * .2;
	height = string_height(associatedSkill.name) * .2;
}
//If spell name is hovered over:
	if (mouse_x >= x && mouse_x <= x + width) && (mouse_y <= y + height && mouse_y >= y) {
		
		mouseOver = true;	
		//If a spell is clicked on, global.targeting is true and spellbook goes away
		if (clickable) {
			if (mouse_check_button_released(mb_left)) {
				global.selectedSkill = associatedSkill;
				global.targeting = true;
				layer_set_visible(spellsLayer, false);
				instance_deactivate_layer(spellsLayer);
				layer_set_visible(spellButtonsLayer, false);
				instance_deactivate_layer(spellButtonsLayer);
				layer_set_visible(buttonLayer, false);
				instance_deactivate_layer(buttonLayer);
				layer_set_visible(cancelButtonLayer, true);
				instance_activate_layer(cancelButtonLayer);
			}
		}
	}
	else {
		mouseOver = false; 	
	}